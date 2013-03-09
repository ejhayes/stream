class DashboardController < ApplicationController
	before_filter :require_authorization

	def dashboard
    @users = User.where("id != ?", current_user.id)
	end

	def tweet
    tweet = Tweet.new :user_id => current_user.id, :message => params[:message]
    if tweet.save
      return render :json => { :status => 'ok'}
    else
      return render :json => { :status => 'error', :error => 'unable to save tweet' }, :status => 400
    end
	end

end