class AddIconIdToGames < ActiveRecord::Migration
  def change
  	remove_column :games, :icon
  	add_column :games, :icon_id, :integer
  end
end
