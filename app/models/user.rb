class User < ApplicationRecord
  has_many :progresses
  has_many :tests, through: :progresses
  has_many :written, class_name: :Test, inverse_of: :writer, foreign_key: :writer_id

  EMAIL_REGEX = /[A-ZА-я0-9._%+-]+@([A-zА-я0-9][-A-zА-я0-9]+\.)+[A-zА-я]{2,4}/i

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: EMAIL_REGEX
  validates :username, presence: true

  has_secure_password

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
