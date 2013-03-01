require 'spec_helper'

describe UsersController do
	
  describe :list_users do
    render_views

    it "shows a list of users" do
      user1 = FactoryGirl.create :user
      user2 = FactoryGirl.create :user

      session[:user_id] = user1.id

      get :list_users

      response.body.should_not match user1.username
      response.body.should match user2.username
    end
  
    it "shows all users as not followed"

    it "redirects me to login if i am not signed in"

    it "lets me follow another user" do
      user1 = FactoryGirl.create :user
      user2 = FactoryGirl.create :user

      session[:user_id] = user1.id

      get :follow, :username => user2.username

      user1.is_following?(user2).should be_true
      user2.is_followed_by?(user1).should be_true

      flash[:notice].should_not be_nil
    end

    it "lets me unfollow another user" do
      user1 = FactoryGirl.create :user
      user2 = FactoryGirl.create :user

      session[:user_id] = user1.id

      get :follow, :username => user2.username

      user1.is_following?(user2).should be_true
      user2.is_followed_by?(user1).should be_true

      # now unfollow them
      get :unfollow, :username => user2.username

      user1.is_following?(user2).should be_false
      user2.is_followed_by?(user1).should be_false

      flash[:notice].should_not be_nil
    end

  end

end