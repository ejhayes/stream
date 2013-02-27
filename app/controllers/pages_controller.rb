class PagesController < ApplicationController

	layout "login", :only => [ :login ]
	
	def login

	end

  def handle_login
    user = User.authenticate(params[:username], params[:password])

    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.username}"
      return redirect_to '/'
    else
      flash[:error] = 'Invalid login'
      return redirect_to '/'
    end
  end

  def logout
    session.delete(:user_id)
    return redirect_to '/', :notice => 'You have been signed out'
  end

end