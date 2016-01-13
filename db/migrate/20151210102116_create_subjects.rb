class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title
      t.timestamps null: false
      t.string :status
    end
  end
end
