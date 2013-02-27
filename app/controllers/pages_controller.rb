class PagesController < ApplicationController

	layout "login", :only => [ :login ]
	
	def login

	end

  def handle_login
    user = User.find_by_username_and_password(params[:username], params[:password])

    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.username}"
      return redirect_to '/me'
    else
      flash[:error] = 'Invalid login'
      return redirect_to '/'
    end
  end

end