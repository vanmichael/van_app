class AddChangedPlayersCountToPools < ActiveRecord::Migration
    def up
  	add_column :pools, :players_count, :integer, :default => 0

  	Pool.find(:all).each do |p|
  		p.update_attribute :players_count, :default
  	end
  end

	 def down
	  	remove_column :pools, :players_count
	 end
end
