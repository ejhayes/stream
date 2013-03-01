class UsersController < ApplicationController
  before_filter :require_authorization

  def list_users
    @users = User.where("id != ?", current_user.id)
  end

  def show

  end

  def follow
    user = User.find_by_username(params[:username])
    current_user.following.build(:to_user_id => user.id).save
    return redirect_to '/users', :notice => "You are now following #{user.username}. Good for you!"
  end

  def unfollow
    user = User.find_by_username(params[:username])
    current_user.following.find_by_to_user_id(user.id).delete

    return redirect_to '/users', :notice => "You are no longer following #{user.username} because they are lame."
  end
end