require 'spec_helper'

describe DashboardController do

	describe 'dashboard' do

		it 'requires me to be signed in to see my dashboard' do
			get :dashboard

			response.should redirect_to '/'
		end

		it 'shows my dashboard if i am signed in' do
			session[:user_id] = 1
			get :dashboard
		end

	end

  describe 'tweet' do

    it 'makes a tweet' do
      user = FactoryGirl.create(:user)

      session[:user_id] = user.id

      post :tweet, :message => 'some random tweet'

      user.tweets.first.message.should == 'some random tweet'
    end

    it 'returns 400 status if we cannot save the tweet' do
      user = FactoryGirl.create(:user)

      session[:user_id] = user.id

      Tweet.should_receive(:new).with(:user_id => user.id, :message => 'test') do
        tweet = double('tweet')
        tweet.should_receive(:save).and_return(false)
        tweet
      end

      post :tweet, :message => 'test'

      response.status.to_i.should == 400

      JSON.parse(response.body).should == JSON.parse({:status => :error, :error => 'unable to save tweet'}.to_json)

    end

  end

end