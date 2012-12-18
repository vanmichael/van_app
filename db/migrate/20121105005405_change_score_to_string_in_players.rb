class ChangeScoreToStringInPlayers < ActiveRecord::Migration
  def change
  	change_column :players, :score, :integer
  end
end
