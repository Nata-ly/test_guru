class Progress < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, on: %i[create update]

  SUCCESS_RATE = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def questions_count
    test.questions.count
  end

  def current_question_index
    test.questions.order(:id).index(current_question) + 1
  end

  def result
    count = questions_count
    count.zero? ? result = 0 : result = (correct_questions * 100 / count)
  end

  def result_success?
    result > SUCCESS_RATE
  end


  private

  def before_validation_set_question
    self.current_question = (self.current_question.nil? ? test.questions.first : next_question)
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.corrects
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
