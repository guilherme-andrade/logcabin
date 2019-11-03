class AddPhotoToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :photo, :string
  end
end
