require 'lastfm'

module LastFM
  class Artists
    class << self
      def get_artists_for(username)
        Lastfm.new(ENV['LASTFM_KEY'], ENV['LASTFM_SECRET']).user.get_top_artists(username)
      end
    end
  end
end