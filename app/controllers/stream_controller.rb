class StreamController < ApplicationController
	before_filter :require_authorization

	def tweet
    tweet = Tweet.new :user_id => current_user.id, :message => params[:message]
    if tweet.save
      return render :json => { :status => 'ok'}
    else
      return render :json => { :status => 'error', :error => 'unable to save tweet' }, :status => 400
    end
	end

  def tweets
    tweets = Tweet.where(:user_id => current_user.id).paginate(:page => params[:page] || 1, :per_page => 50).order('created_at DESC')
    pages = (tweets.total_entries / tweets.per_page).ceil

    out = {
      :has_next => tweets.current_page < pages,
      :has_previous => tweets.current_page > 1,
      :page_size => tweets.per_page,
      :page_number => tweets.current_page,
      :timestamp => Time.now.to_i,
      :data => 
        tweets.map do |tweet|
          { :author => tweet.user.username, :message => tweet.message, :timestamp => tweet.created_at.to_i }
        end
    }

    return render :json => out
  end

end