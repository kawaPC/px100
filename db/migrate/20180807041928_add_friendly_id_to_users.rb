class AddFriendlyIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :friendly_id, :text
  end
end
