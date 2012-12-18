class Pool < ActiveRecord::Base
  attr_accessible :total_credits, :players_count, :credit_limit, 
  :name, :max_players, :user_credits, :user_id, :game_id, :game_type

  # after_create :calculate_credit_limit
  belongs_to :game
  belongs_to :user
  has_many :players

  def credit_limit
  	self.user_credits * self.max_players
  end
end