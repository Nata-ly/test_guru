class AddDetailsToProgresses < ActiveRecord::Migration[6.1]
  def change
    add_column :progresses, :correct_questions, :integer, default: 0
    add_belongs_to :progresses, :current_question, foreign_key: { to_table: :questions }
  end
end
