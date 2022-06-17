class AddUserRefToTests < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :tests, :writer, foreign_key: { to_table: :users }
  end
end
