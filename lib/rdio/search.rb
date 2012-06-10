require 'rdio'

module Rdio
  class Search
  
  def lookup_suggestion(tweet)
    suggestion = Rdio.search(artist: tweet)
    suggestion
  end
    
  
  end
end