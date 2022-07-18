class ChangeCorrectToAnswes < ActiveRecord::Migration[6.1]
  def change
    change_column :answers, :correct, 'boolean USING CAST(correct AS boolean)'
    change_column_default :answers, :correct, false
  end
end
