require 'rdio'

module Rdio
  class Search
  
  def lookup_suggestion(tweet)
    
  end
  
  def process_tweet(pre_processed_tweet)
    suggestion = Rdio::init(ENV['RDIO_KEY'], ENV['RDIO_SECRET'])
    artist_data = suggestion.search(pre_processed_tweet)
    
    result = JSON.parse(artist_data)
    
    if result.has_key? 'Error'
       raise "Rdio error"
    end
    # if song is found then get the embed_url
    # save a new processed_tweet active record
  end
  
  end
end