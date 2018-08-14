class AddColumnToAlbum < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :cover_picture, :string
  end
end
