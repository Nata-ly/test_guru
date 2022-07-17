class AddVisibleToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :visible, :boolean, index:true, default: :false
  end
end
