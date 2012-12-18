class GamesController < ApplicationController
	before_filter :signed_in_user

	def index
		@games = Game.paginate(page: params[:page])
	end

	def new
		@game = Game.new
		@icons = Icon.find :all
	end

	def show
		@game = Game.find_by_id(params[:id])
	end

	def create
		@game = current_user.games.build(params[:game])
		if @game.save
			flash[:success] = "Game created!"
			redirect_to games_path #this will change
		else
			flash[:notice] = "Sorry game not created"
			@feed_items = current_user.feed.paginate(page: params[:page])
			render 'static_pages/home' #this will change
		end
	end

	def edit
		@game = Game.find_by_id(params[:id])
		@icons = Icon.find :all
	end

	def update
		@game = Game.find_by_id(params[:id])
		if @game.update_attributes(params[:game])
        	flash[:success] = "Game updated"
        	redirect_to games_path
    	else
    		flash[:success] = "Sorry Game not updated"
    		redirect_to games_path
		end
	end

	def destroy
		@game.destroy
		redirect_to root_path
	end
end
