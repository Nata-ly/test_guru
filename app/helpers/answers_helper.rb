module AnswersHelper
  def answer_header(answer)
    if answer.new_record?
      t('answers_page.form.h1_new', title: answer.question.body)
    else
      t('answers_page.form.h1_edit', title: answer.question.body)
    end
  end
end
