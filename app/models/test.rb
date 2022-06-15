class Test < ApplicationRecord
  # Возвращает массив названий тестов в заданной категории по title
  # => ["Основы баз данных", ...]
  def self.category(category_title)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
    .where('categories.title = ?', category_title)
    .order('tests.title': :desc)
    .pluck('tests.title')
  end
end
