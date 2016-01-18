class CreateTimeInfos < ActiveRecord::Migration
  def change
    create_table :time_infos do |t|
      t.integer :subject_id
      t.timestamps null: false
    end
  end
end
