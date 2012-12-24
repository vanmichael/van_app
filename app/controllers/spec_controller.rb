class SpecController < ApplicationController
  def index
  	redirect_to :controller => "user", :action => "index"
  end

  #Edit the user's spec
  def edit
  	@title = "Edit Spec"
  	@user = User.find_by_id(current_user.id)
  	@user.spec ||= Spec.new
  	@spec = @user.spec
  	if param_posted?(:spec)
  		if @user.spec.update_attributes(params[:spec])
  			flash[:notice] = "Changes Saved."
  			redirect_to :controller => "user", :action => "index"
  		end
  	end
  end
end
