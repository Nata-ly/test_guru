class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :checking_max_ansver_for_question

  MAX_ANSWER = 4

  scope :corrects, -> { where(correct: :true) }

  private

  def checking_max_ansver_for_question
    errors.add(:answers, 'Maximum answers reached') if question.answers.count > MAX_ANSWER
  end

end
