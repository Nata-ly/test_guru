class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.integer :correct
      t.references :question, null:false, index:true, foreign_key:true

      t.timestamps
    end
  end
end
