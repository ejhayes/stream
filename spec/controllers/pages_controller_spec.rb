require 'spec_helper'

describe PagesController do
  describe 'login' do
    it 'shows the login form' do
      get :login
    end

    it 'will sign me in with a valid user' do
      user = FactoryGirl.create(:user)

      post :handle_login, :username => user.username, :password => user.password

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

  describe 'logout' do
    it 'will sign me out after i signed in' do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id

      get :logout
      session[:user_id].should be_nil

      flash[:notice].should_not be_nil

      response.should redirect_to '/'
    end
  end
end