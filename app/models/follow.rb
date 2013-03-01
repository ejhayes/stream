class Follow < ActiveRecord::Base
  attr_accessible :from_user_id, :to_user_id

  validates_presence_of :from_user_id, :to_user_id
  validates_uniqueness_of :to_user_id, :scope => :from_user_id

  validate :user_cannot_follow_themselves

  belongs_to :from_user, :foreign_key => :from_user_id, :class_name => 'User'
  belongs_to :to_user, :foreign_key => :to_user_id, :class_name => 'User'

  def user_cannot_follow_themselves
    if from_user_id  == to_user_id
      errors.add(:to_user_id, "Can't follow yourself")
    end
  end
end