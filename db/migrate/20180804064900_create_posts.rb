class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :picture
      t.references :user, foreign_key: true
      t.references :album, foreign_key: true

      t.timestamps
    end
      remove_index :albums, [:user_id, :created_at]
      add_index :posts, [:album_id, :created_at]
  end
end
