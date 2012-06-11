require './lib/rdio/search.rb'

class TwitterCrawler

  HASH_TAGS = %W{#wakeup #getbig #getdrunk #passout #hookup #dowork }

  attr_accessor :errors

  def initialize
    self.errors = []
  end

  def process_new_tweets
    results = []
    Twitter.search("#autotuneapp").map do |tweet|
      pre_processed = pre_process_tweet(tweet)
      if pre_processed.should_process
        begin
          ProcessedTweet.save_processed(pre_processed)
        rescue => ex
          errors.push ex: ex, processed: pre_processed
        end
      end
    end
  end


  def pre_process_tweet(tweet)
    processed = PreProcessedTweet.new
    processed.ignore = tweet.text.include?("#needsuggestions") or tweet.text.include?("#autotune ") or tweet.text.include? ("#AutoTuneApp playlist")
    unless processed.ignore
      processed.tweet = tweet
      processed.moods = _process_moods(tweet.text)
      processed.search_queries = _process_search_queries(tweet.text)
    end
    processed
  end

  def _process_moods(text)
    hash_tags = %W{#wakeup #getbig #getdrunk #passout #hookup #dowork }
    text_to_search = text.downcase + " "
    hash_tags.keep_if do |tag|
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
  attr_accessor :search_queries, :moods, :tweet, :ignore

  def should_process
    !ignore and search_queries.any? and moods.any? and !ProcessedTweet.where(tweet_id: tweet.id).exists?
  end
end

class FakeTweet
  attr_accessor :text, :id
end