class AddSuccessToProgresses < ActiveRecord::Migration[6.1]
  def change
    add_column :progresses, :success, :boolean, default: false
  end
end
