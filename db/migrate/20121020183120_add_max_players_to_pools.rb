class AddMaxPlayersToPools < ActiveRecord::Migration
  def change
  	add_column :pools, :max_players, :integer
  end
end
