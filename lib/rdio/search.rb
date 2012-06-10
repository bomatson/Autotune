require 'rdio'
require 'twitter_crawler.rb'

module Rdio
  class Search

    def self.process_tweet(processed)
      suggestion = Rdio::init(Rails.application.config.rdio[:key], Rails.application.config.rdio[:secret])
      processed.search_queries.each do |q|
        track_data = suggestion.search(q, "t")
        return track_data.first.embed_url unless q.empty?
      end

      nil
    end
  end
end