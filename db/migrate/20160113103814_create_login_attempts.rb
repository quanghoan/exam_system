class CreateLoginAttempts < ActiveRecord::Migration
  def change
    create_table :login_attempts do |t|
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
