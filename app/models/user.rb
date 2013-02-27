class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :username, :password
  
  validates_presence_of :username, :password
  validates_uniqueness_of :username

  # TODO: username is case sensitive
  
  def self.authenticate(username, password)
    find_by_username(username).try(:authenticate, password)
  end
end
