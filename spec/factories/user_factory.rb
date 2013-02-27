require 'factory_girl'

FactoryGirl.define do
	factory :user do
    username { Faker::Internet.user_name }
    password { SecureRandom.hex(6) }
  end
end