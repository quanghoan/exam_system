class AddUserIdToTimeInfos < ActiveRecord::Migration
  def change
    add_column :time_infos, :user_id, :integer
  end
end
