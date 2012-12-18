class DropTotalPlayersFromPools < ActiveRecord::Migration
  def change
  	remove_column :pools, :total_players
  end
end
