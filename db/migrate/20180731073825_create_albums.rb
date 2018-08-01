class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.text :album_name
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :albums, [:user_id, :created_at]
  end
end
