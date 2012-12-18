class IconsController < ApplicationController
	before_filter :signed_in_user

	def new
		@icon = Icon.new
		render 'icons/new'
	end

	def create
		@icon = current_user.icons.build(params[:icon])
		if @icon.save
			flash[:success] = "New Icon uploaded"
			redirect_to root_path
		else
			flash[:notice] = "Icon not uploaded"
			@feed_items = current_user.feed.paginate(page: params[:page])
			render 'static_pages/home' #this will change
		end
	end
end