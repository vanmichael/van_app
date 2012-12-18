class PoolsController < ApplicationController
	before_filter :signed_in_user

	def index
		@pools = Pool.paginate(page: params[:page])
	end

	def new
		@game = Game.find_by_id(params[:game_id], :include => [{ :pools => :user }])
		#@game = Game.find(params[:game_id])
		@pool = Pool.new
	end

	def show
		@game = Game.find_by_id(params[:game_id], :include => [{ :pools => :user }])
		@pool = Pool.find(params[:id])
		@player = Player.new
		@players = Player.find_all_by_pool_id(params[:id])
		# @team1 = @players.Player.find(:all, :conditions => "team = 1")

	end

	def create
		@game = Game.find(params[:game_id])
		@pool = @game.pools.build(params[:pool])
		@pool.user_id = current_user.id
		if @pool.save
			flash[:success] = "Pool created!"
			redirect_to game_pool_path(@game,@pool)  #this will change
		else
			flash[:notice] = "Sorry pool not created"
			@feed_items = current_user.feed.paginate(page: params[:page])
			render 'static_pages/home' #this will change
		end
	end
end