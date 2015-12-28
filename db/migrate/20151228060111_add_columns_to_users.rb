class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :phone, :integer
    add_column :users, :dob, :date
  end
end
