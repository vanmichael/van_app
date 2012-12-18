class PlayersController < ApplicationController

	def index

	end

	def create
		@game = Game.find(params[:game_id])
		@pool = Pool.find_by_id(params[:pool_id])
		@player = @pool.players.build(params[:player])
		@player.user_id = current_user.id
		if @player.save
			flash[:success] = "You are now a member of this pool"
			redirect_to game_pool_path(@game,@pool)
		else
			flash[:notice] = "Sorry you were unable to join the pool"
			render 'static_pages/home' #this will change
		end
	end
end