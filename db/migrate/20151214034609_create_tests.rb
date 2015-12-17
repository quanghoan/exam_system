class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
    	t.references :user, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
