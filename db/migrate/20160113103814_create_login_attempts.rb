class CreateLoginAttempts < ActiveRecord::Migration
  def change
    create_table :login_attempts do |t|
      t.boolean :message, default: false
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
