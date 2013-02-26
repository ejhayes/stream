require 'spec_helper'

describe PagesController do
  describe 'login' do
    it 'shows the login form' do
      get :login
    end

    it 'will sign me in with a valid user' do
      post :handle_login, :username => 'losops', :password => 'swordfish'

      response.should redirect_to '/'

      flash[:error].should be_nil
      flash[:notice].should_not be_nil

      session[:user_id].should_not be_nil
    end

    it 'will not sign me in with an invalid user' do
      post :handle_login, :username => 'bizaro', :password => 'clownfish'

      response.should redirect_to '/'

      flash[:error].should_not be_nil
      flash[:notice].should be_nil

      session[:user_id].should be_nil
    end
  end
end