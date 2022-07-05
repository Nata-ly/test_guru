class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :progresses
  has_many :gists
  has_many :tests, through: :progresses
  has_many :written, class_name: :Test, inverse_of: :writer, foreign_key: :writer_id

  EMAIL_REGEX = /[A-ZА-я0-9._%+-]+@([A-zА-я0-9][-A-zА-я0-9]+\.)+[A-zА-я]{2,4}/i

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: EMAIL_REGEX
  validates :first_name, presence: true
  validates :last_name, presence: true

  def passed_test(level)
    tests.where(level: level)
  end

  def test_passage(test)
    progresses.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
