class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :progresses
  has_many :users, through: :progresses
  belongs_to :writer, class_name: :User

  scope :simple, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :difficult, -> { where(level: 5..Float::INFINITY) }

  scope :with_category, ->(category_title) { joins(:category).where(category: { title: category_title }) }
  scope :by_title, -> { order(title: :desc) }

  # Возвращает массив названий тестов в заданной категории по title
  # => ["Основы баз данных", ...]
  def self.with_title_category(category_title)
    with_category(category_title).by_title.pluck('title')
  end
end
