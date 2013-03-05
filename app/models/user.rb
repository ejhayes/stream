class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :username, :password
  
  validates_presence_of :username, :password
  validates_uniqueness_of :username

  # TODO: username is case sensitive
  
  def self.authenticate(username, password)
    find_by_username(username).try(:authenticate, password)
  end

  has_many :following, :foreign_key => 'from_user_id', :class_name => 'Follow'
  has_many :followed_by, :foreign_key => 'to_user_id', :class_name => 'Follow'

  has_many :users_i_follow, :through => :following, :class_name => 'User', :source => :to_user
  has_many :users_following_me, :through => :followed_by, :class_name => 'User', :source => :from_user

  has_many :tweets

  def is_following? user
  	users_i_follow.where(:id => user.id).any?
  end

  def is_followed_by? user
  	users_following_me.where(:id => user.id).any?
  end
end
