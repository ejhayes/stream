require 'spec_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.build(:user)
  end

  it "prevents duplicate usernames" do
    FactoryGirl.create(:user, username: 'Fred')
    FactoryGirl.build(:user, username: 'Fred').should_not be_valid
  end

  it "requires username" do
    FactoryGirl.build(:user, username: nil).should_not be_valid
  end
end