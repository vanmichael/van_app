class DropImageFromGames < ActiveRecord::Migration
  def change
  	remove_column :games, :images
  end
end
