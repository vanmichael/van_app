class FriendshipsController < ApplicationController

	before_filter :signed_in_user

	def new
		@friend = Friendship.new(params[:friendship])
	end

	def create
		@user = User.find_by_id(params[:id])
		@friend = Friendship.new(params[:friendship])
		if @friend.save
			flash[:success] = "Friend Request Sent"
			redirect_to root_path
		else
			flash[:notice] = "Sorry Friend Not Created"
			redirect_to root_path
		end
	end

	def update

	end

	def destroy
	
	end
end