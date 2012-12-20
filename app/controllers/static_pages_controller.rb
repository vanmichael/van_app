class StaticPagesController < ApplicationController
  def home
      @total_users = User.count
  	if signed_in?
    	@micropost = current_user.microposts.build
    	@feed_items = current_user.feed.paginate(page: params[:page] )
      # logger.debug "New Feed Item: #{@feed_items.inspect}"
      @credit_items = current_user.players.paginate(page: params[:page])
      @pool_credits = @credit_items.sum(:bet_amount)
      @total_credits = current_user.credit + @pool_credits
  	end
  end

  def help
  end

  def about
  end

  def contact
  end
  
end