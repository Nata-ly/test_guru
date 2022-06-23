class User < ApplicationRecord
  has_many :progresses
  has_many :tests, through: :progresses
  has_many :written, class_name: :Test, inverse_of: :writer, foreign_key: :writer_id

  validates :email, presence: true
  validates :username, presence: true

  enum role: {
    admin: 0,
    user: 1,
    archived: 2
  }

  def passed_test(level)
    tests.where(level: level)
  end

  def test_passage(test)
    progresses.order(id: :desc).find_by(test_id: test.id)
  end
end
