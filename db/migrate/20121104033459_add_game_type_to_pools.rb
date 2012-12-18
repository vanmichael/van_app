class AddGameTypeToPools < ActiveRecord::Migration
  def change
  	add_column :pools, :game_type, :integer
  end
end
