class AddGameIdToPools < ActiveRecord::Migration
  def change
  	add_column :pools, :game_id, :integer
  end
end
