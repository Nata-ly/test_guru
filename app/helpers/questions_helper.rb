module QuestionsHelper
  def question_header(question)
    if question.new_record?
      t('questions_page.form.h1_new', title: question.test.title)
    else
      t('questions_page.form.h1_edit', title: question.test.title)
    end
  end
end
