class Tweet < ActiveRecord::Base
  attr_accessible :user_id, :message

  belongs_to :user

  validates_presence_of :user_id, :message
end