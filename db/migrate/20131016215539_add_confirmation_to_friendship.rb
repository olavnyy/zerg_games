class AddConfirmationToFriendship < ActiveRecord::Migration
  def change
  	add_column :friendships, :confirmed, :boolean, :default => false
  end

  def down
  	remove_column :friendships, :confirmed
  end
end
