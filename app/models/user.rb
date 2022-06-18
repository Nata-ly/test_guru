class User < ApplicationRecord
  has_many :progresses
  has_many :tests, through: :progresses
  has_many :written, class_name: :Test, inverse_of: :writer, foreign_key: :writer_id

  enum role: {
    admin: 0,
    user: 1,
    archived: 2
  }

  def passed_test(level)
    Test.joins('JOIN progresses ON tests.id = progresses.test_id')
    .where('progresses.user_id = ? AND tests.level = ?', self.id, level)
  end
end
