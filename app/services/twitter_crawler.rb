class TwitterCrawler

  HASH_TAGS = %W{#wakeup #getbig #getdrunk #passout #hookup #dowork }

  def process_tweets(tweets)

  end

  def pre_process_new_tweets
    results = []
    Twitter.search("#autotuneapp", rpp: 1).map do |tweet|
      # check if the tweet has already been processed - very slow would normally do this in batch
      unless ProcessedTweet.where(tweet_id: tweet.id).exists?
         pre_process_tweet(tweet)
      end
    end
  end

  def pre_process_tweet(tweet)
    processed = PreProcessedTweet.new
    processed.tweet = tweet
    processed.moods = _process_moods(tweet.text)
  end

  def _process_moods(text)
    text_to_search = text.downcase + " "
    HASH_TAGS.keep_if do |tag|
      text_to_search.include?(tag + " ") or text_to_search.include?(tag + "#")
    end
  end

end

class PreProcessedTweet
  attr :possible_artists, :possible_songs, :moods, :tweet
end