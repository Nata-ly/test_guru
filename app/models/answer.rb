class Answer < ApplicationRecord
  belongs_to :question

  enum correct: {
    false: 0,
    true: 1
  }

  scope :corrects, -> { where(correct: :true) }
end
