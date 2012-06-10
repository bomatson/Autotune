require 'rdio'
require 'twitter_crawler.rb'

module Rdio
  class Search
    attr_accessible :embed_url
  
  def process_tweet(processed)
    suggestion = Rdio::init(ENV['RDIO_KEY'], ENV['RDIO_SECRET'])
    track_data = suggestion.search(processed, "t")
    
    embed = track_data.first.embed_url
    
    if embed.empty? 
      raise 'Rdio error'
    end
    
    :embed_url = embed

  end
  
  end
end