class TwitterCrawler

  HASH_TAGS = %W{#wakeup #getbig #getdrunk #passout #hookup #dowork }

  def process_new_tweets
    results = []
    Twitter.search("#autotuneapp", rpp: 1).map do |tweet|
      pre_processed = pre_process_tweet(tweet)

      if pre_processed.should_process
        process_tweet(pre_processed)
      end
    end
  end

  def process_tweet(pre_processed_tweet)
    # search for song
    # if song is found then get the embed_url
    # save a new processed_tweet active record
  end

  def pre_process_tweet(tweet)
    processed = PreProcessedTweet.new
    processed.tweet = tweet
    processed.moods = _process_moods(tweet.text)
    processed.search_queries = _process_search_queries(tweet.text)
    processed
  end

  def _process_moods(text)
    text_to_search = text.downcase + " "
    HASH_TAGS.keep_if do |tag|
      text_to_search.include?(tag + " ") or text_to_search.include?(tag + "#")
    end
  end

  def _process_search_queries(text)
    queries = []
    text = text.downcase

    parts = text.split('#autotuneapp')
    parts.each do |part|
      part = cleanse_text_of_noise(part).strip
      queries.push(part) unless part.blank?
    end

    queries
  end

  def cleanse_text_of_noise(text)
    text.gsub(/#([A-Za-z0-9_]+)/, '').gsub(/@([A-Za-z0-9_]+)/, '').gsub(' by ', ' ').gsub(/\s\s/, ' ')
  end
end

class PreProcessedTweet
  attr_accessor :search_queries, :moods, :tweet

  def should_process
    search_queries.any? and moods.any? and !ProcessedTweet.where(tweet_id: tweet.id).exists?
  end
end

class FakeTweet
  attr_accessor :text, :id
end