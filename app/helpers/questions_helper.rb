module QuestionsHelper
  def question_header(test_title)
    text = t('questions_page.form.h1_new', title: test_title)  if params[:action] == 'new'
    text = t('questions_page.form.h1_edit', title: test_title) if params[:action] == 'edit'
    text ||= ''
  end
end
