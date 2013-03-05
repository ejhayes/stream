require 'spec_helper'

describe Tweet do
  it "has a valid factory" do
    FactoryGirl.build(:tweet)
  end

  it "requires a user_id" do
    FactoryGirl.build(:tweet, :user_id => nil).should be_invalid
  end

  it "requires a message" do
    FactoryGirl.build(:tweet, :message => nil).should be_invalid
  end

end