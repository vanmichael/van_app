class DropImageFromGames2 < ActiveRecord::Migration
  def change
  	remove_column :games, :image
  end
end
