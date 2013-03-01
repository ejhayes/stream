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
end