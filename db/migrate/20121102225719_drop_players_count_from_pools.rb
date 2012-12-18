class DropPlayersCountFromPools < ActiveRecord::Migration

  def change
  	remove_column :pools, :players_count
  end
end
