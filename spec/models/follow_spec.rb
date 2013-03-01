require 'spec_helper'

describe Follow do
  it "has a valid factory" do
    FactoryGirl.build(:follow)
  end

  it "prevents a user from following themselves" do
    user1 = FactoryGirl.create :user

    follow = Follow.new :from_user_id => user1.id, :to_user_id => user1.id

    follow.save.should be_false
  end

  it "requires both a to_user and from_user" do
    follow = Follow.new
    follow.save.should be_false

    user1 = FactoryGirl.create :user
    follow.from_user_id = user1.id
    follow.save.should be_false

    user2 = FactoryGirl.create :user
    follow.to_user_id = user2.id
    follow.save.should be_true
  end

  it "shows me if i am following someone or being followed by them" do
    follow = Follow.new
    
    user1 = FactoryGirl.create :user
    follow.from_user_id = user1.id
    
    user2 = FactoryGirl.create :user
    follow.to_user_id = user2.id
    follow.save

    user1.is_following?(user2).should be_true
    user2.is_followed_by?(user1).should be_true

    user2.is_following?(user1).should be_false
    user1.is_followed_by?(user2).should be_false
  end

end