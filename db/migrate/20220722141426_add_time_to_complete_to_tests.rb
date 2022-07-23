class AddTimeToCompleteToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :time_to_complete, :integer
  end
end
