require 'factory_girl'

FactoryGirl.define do
	factory :follow do
    
    association :from_user, :factory => :user
    association :to_user, :factory => :user
  end
end