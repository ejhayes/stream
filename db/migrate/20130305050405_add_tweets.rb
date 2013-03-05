class AddTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :user_id
      t.string :message
 
      t.timestamps
    end

    add_foreign_key :tweets, :users, :name => :fk_tweets_to_users, :dependent => :delete
  end
end
