module ProgressesHelper

  def result_percentage(progress)
    if progress.result_success?
      content_tag(:div, t('progresses_page.result_successful', result: progress.result), class: 'succes-result')
    else
      content_tag(:div, t('progresses_page.result_unsuccessful', result: progress.result), class: 'unsuccess-result')
    end
  end
end
