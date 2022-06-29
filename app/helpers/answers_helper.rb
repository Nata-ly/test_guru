module AnswersHelper
  def answer_header(answer)
    if answer.new_record?
      t('.header_new', title: answer.question.body)
    else
      t('.header_edit', title: answer.question.body)
    end
  end
end
