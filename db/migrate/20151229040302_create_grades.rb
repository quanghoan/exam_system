class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :score
      t.integer :user_id
      t.text :short_question
      t.integer :subject_id
      t.timestamps null: false
    end
  end
end
