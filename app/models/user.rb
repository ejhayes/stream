class User < ActiveRecord::Base
	attr_accessible :username, :password

	validates_presence_of :username, :password

	validates_uniqueness_of :username
end