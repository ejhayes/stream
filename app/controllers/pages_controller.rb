class PagesController < ApplicationController

	layout "login", :only => [ :login ]
	
	def login

	end

  def handle_login
    if params[:username] == 'losops' && params[:password] == 'swordfish'
      session[:user_id] = 1
      flash[:notice] = 'Welcome'
    else
      flash[:error] = 'Invalid login'
    end

    return redirect_to '/'
  end

end