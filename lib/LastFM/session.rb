require 'lastfm'

module LastFM
  class Session
    attr_reader :connection
    
    def initialize(session = nil)#, username)
      raise NoUserSession if session.nil?
      @session = session
      @connection = create_lastfm_connection
    end
    
    # def get_artists
    #   Artists.get_artists_for(@username)
    # end
    
  private
    def create_lastfm_connection
      # lastfm = Lastfm.new(ENV['LASTFM_KEY'], ENV['LASTFM_SECRET'])
      # lastfm.session = @session
      # lastfm
      # above is the same as below
      Lastfm.new(ENV['LASTFM_KEY'], ENV['LASTFM_SECRET']).tap do |lastfm|
        lastfm.session = @session
      end      
    end    
  end
end