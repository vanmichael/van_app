class AddTeamToPools < ActiveRecord::Migration
  def change
  	add_column :pools, :team, :integer
  end
end
