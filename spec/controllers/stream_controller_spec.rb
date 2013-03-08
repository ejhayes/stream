require 'spec_helper'

describe StreamController do

  describe 'posting to Tweet' do

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

  describe 'getting Tweets' do

    it 'returns a json object with tweets' do

      user = FactoryGirl.create(:user)
      session[:user_id] = user.id

      tweet = FactoryGirl.create(:tweet, :user_id => user.id)

      default_time = 1234
      Time.stub(:now).and_return(default_time)

      get :tweets

      response.status.to_i.should == 200

      JSON.parse(response.body).should == JSON.parse({
        :has_next => false,
        :has_previous => false,
        :page_size => 50,
        :page_number => 1,
        :timestamp => default_time,
        :data => [{:message => tweet.message, :author => tweet.user.username, :timestamp => tweet.created_at.to_i}]
      }.to_json)

    end

  end

end