class ProcessedTweet < ActiveRecord::Base
  attr_accessible :tweet_id, :embed_url, :from_user_name
  
  def save_tweet
    new_tweet = Rdio::Search.new.process_tweet(:embed_url)
    new_tweet.save

  end
end
