class ChangeTableFriendships < ActiveRecord::Migration
  def change
  	add_column :friendships, :friended_id, :integer
  	add_column :friendships, :friends, :boolean, :default => false
  	remove_column :friendships, :user_id
  end
end
