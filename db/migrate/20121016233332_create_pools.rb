class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.integer :total_credits
      t.integer :total_players

      t.timestamps
    end
  end
end
