class AddPictureToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :picture, :string
  end
end
