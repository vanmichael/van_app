class FeedBackController < ApplicationController
before_filter :signed_in_user
# before_filter :correct_user,   only: [:new, :submit_feedback]
# before_filter :admin_user,     only: :show_feedback

  def new
    @feedback = Feedback.new
    if current_user.admin?
      flash[:success] = "Here is your feedback"
      @feedbacks = Feedback.all
      render 'feedbacks/show_feedback'
    else
      render 'static_pages/feedback'
    end
  end

  def submit_feedback
    @feedback = current_user.feedbacks.build(params[:feedback])
      if @feedback.save
        flash[:success] = "Thank you your feedback is sent!"
        redirect_to root_path
      else
        render 'static_pages/feedback'
      end
  end


  private

  def correct_user
			@current_user = current_user.feedbacks.find_by_id(params[:id])
			redirect_to root_path if @current_user.nil?
	end

  # def admin_user
  #     render 'static_pages/feedback' unless current_user.admin?
  # end
end
