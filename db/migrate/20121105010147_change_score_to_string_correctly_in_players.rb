class ChangeScoreToStringCorrectlyInPlayers < ActiveRecord::Migration
  def change
  	change_column :players, :score, :string
  end
end
