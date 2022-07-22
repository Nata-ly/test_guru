module BadgesHelper
  def badge_category(str)
    t("admin.badges.index.#{str}")
  end

  def badge_value_title(rule_name, rule_value)
    if rule_name == 'category'
      str = Category.find(rule_value).title
    elsif rule_name == 'attempt'
      str = Test.find(rule_value).title
    else
      str = rule_value
    end
    str
  end

  def badge_image(badge)
    if current_user.badges.include?(badge)
      image_tag(badge.image.present? ? badge.image : 'badges/default.png')
    else
      image_tag(badge.image.present? ? badge.image : 'badges/default.png', class: 'filter')
    end
  end
end
