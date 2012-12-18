class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :pool_id
      t.integer :user_id
      t.integer :bet_amount
      t.boolean :win, :default => false
      t.integer :winnings
      t.integer :losses

      t.timestamps
    end
  end
end
