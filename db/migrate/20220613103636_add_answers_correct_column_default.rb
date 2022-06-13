class AddAnswersCorrectColumnDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:answers, :correct, 0)
  end
end
