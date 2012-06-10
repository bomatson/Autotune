require 'rdio'

module Rdio
  class Artists
    class << self
      def get_artists_for(username)
        Rdio.new(ENV['RDIO_KEY'], ENV['RDIO_SECRET']).user.get_artists_for(username)
      end
    end
  end
end