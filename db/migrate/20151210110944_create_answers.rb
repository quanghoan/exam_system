class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true, foreign_key: true
      t.string :content
      t.boolean :correct_answer, default: false
      t.integer :test_id
      t.timestamps null: false
    end
  end
end
