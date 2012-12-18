class Player < ActiveRecord::Base
  attr_accessible :pool_id, :bet_amount, :user_id, :team, :score
  belongs_to :pool
  belongs_to :user

  after_create :increment_players_count
  after_create :decrement_user_credit
  after_create :increment_total_credit_count

  def increment_players_count
  	self.pool.increment!(:players_count, by = 1)
  end

  def decrement_user_credit
  	@credit = self.bet_amount
  	self.user.decrement!(:credit, by = @credit)
  end

  def increment_total_credit_count
    @credit = self.bet_amount
    self.pool.increment!(:credit_counter, by = @credit)
  end
end