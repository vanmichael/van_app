class FriendshipsController < ApplicationController
before_filter :setup_friends
  #send a friend request.
  #We'd rather call this "request", but that's not allowed by rails

  def create
    Friendship.request(@user, @friend)
    flash[:notice] = "Friend request sent."
    redirect_to profile_for(@friend)
  end

  private

  def setup_friends
    @user = User.find_by_id(current_user)
    @friend = User.find_by_screen_name(params[:user])
  end
    
end
