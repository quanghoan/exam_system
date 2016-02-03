class CreateSubjectDones < ActiveRecord::Migration
  def change
    create_table :subject_dones do |t|
      t.integer :subject_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
