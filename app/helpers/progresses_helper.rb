module ProgressesHelper
  SUCCESS_RATE = 85

  def questions_count(progress)
    progress.test.questions.count
  end

  def current_question_index(progress)
    progress.test.questions.order(:id).index(progress.current_question) + 1
  end

  def result_percentage(progress)
    count = questions_count(progress)
    count.zero? ? result = 0 : result = (progress.correct_questions * 100 / count)

    if result > SUCCESS_RATE
      content_tag(:div, t('progresses_page.result_successful', result: result), class: 'succes-result')
    else
      content_tag(:div, t('progresses_page.result_unsuccessful', result: result), class: 'unsuccess-result')
    end
  end
end
