class ProcessedTweet < ActiveRecord::Base
  attr_accessible :tweet_id, :embed_url, :from_user_name
  
  def self.save_processed(processed)
    new_tweet = ProcessedTweet.new
    new_tweet.embed_url = Rdio::Search.process_tweet(processed) if processed.search_queries.any?
    new_tweet.text = processed.tweet.text
    new_tweet.from_user = processed.tweet.from_user
    new_tweet.tweet_id = processed.tweet.id
    new_tweet.from_user_name = processed.tweet.from_user_name

    new_tweet.save!
  end
end
