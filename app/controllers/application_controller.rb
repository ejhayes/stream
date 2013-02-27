class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_authorization
  	unless session.include?(:user_id)
  		flash[:error] = 'Please login'
	  	return redirect_to '/'
	end
  end
end
