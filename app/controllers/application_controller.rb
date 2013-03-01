class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :signed_in?, :current_user

  def require_authorization
  	unless session.include?(:user_id)
  		flash[:error] = 'Please login'
	  	return redirect_to '/'
	end
  end

  def signed_in?
  	session.include? :user_id
  end

  def current_user
  	User.find session[:user_id]
  end
end
