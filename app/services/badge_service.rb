class BadgeService
  def call(progress)
    @progress = progress
    Badge.all.each do |badge|
      give_badge(badge) if send("#{badge.rule_name}_check?", badge)
    end
  end

  private

  def give_badge(badge)
    @progress.user.badges.push(badge)
  end

  def level_check?(badge)
    return false unless badge.rule_value.to_i == @progress.test.level

    all_tests = Test.where(level: badge.rule_value)
    user_tests = Test.joins(:progresses).where(level: badge.rule_value, progresses: { success: true, user_id: @progress.user.id})

    return false unless user_tests.uniq.count == all_tests.count

    # выдаем бадж повторно только за полное успешное прохождение всех тестов уровня,
    # проверяем что все тесты уровня пройдены больше раз, чем получено бейджев
    user_tests_count = user_tests.group(:id).count
    return false if user_tests_count.values.min <= @progress.user.badges.where(id: badge.id).count

    true

  end

  def category_check?(badge)
    return false unless badge.rule_value.to_i == @progress.test.category.id

    all_tests = Test.where(category_id: badge.rule_value)
    user_tests = Test.joins(:progresses).where(category_id: badge.rule_value, progresses: { success: true, user_id: @progress.user.id})

    return false unless user_tests.uniq.count == all_tests.count

    # выдаем бадж повторно только за полное успешное прохождение всех тестов категории,
    # проверяем что все тесты категории пройдены больше раз, чем получено бейджев
    user_tests_count = user_tests.group(:id).count
    return false if user_tests_count.values.min <= @progress.user.badges.where(id: badge.id).count

    true
  end

  def attempt_check?(badge)
    return false unless badge.rule_value.to_i == @progress.test.id
    return false if @progress.user.tests.where(id: badge.rule_value).count > 1

    # проверяем что тест проиден успешно
    return false unless @progress.success

    true
  end
end
