require 'factory_girl'

FactoryGirl.define do
	factory :tweet do
    
    association :user, :factory => :user
    
    message "this is a test tweet"
  end
end