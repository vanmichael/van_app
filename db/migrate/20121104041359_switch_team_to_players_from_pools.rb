class SwitchTeamToPlayersFromPools < ActiveRecord::Migration
 def change
 	add_column :players, :team, :integer
 	remove_column :pools, :team
 end
end
