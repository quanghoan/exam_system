class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.references :subject, index: true, foreign_key: true
      t.references :test, index: true, foreign_key: true
      t.integer :question_type

      t.timestamps null: false
    end
  end
end
