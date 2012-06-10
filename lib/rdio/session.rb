require 'rdio'
require 'omniauth-rdio'

module Rdio
  class Session
    attr_reader :connection
    
    def initialize(session = nil)#, username)
      raise NoUserSession if session.nil?
      @session = session
      @connection = create_rdio_connection
    end
    
    # def get_artists
    #   Artists.get_artists_for(@username)
    # end
    
  private
    def create_rdio_connection
      Rdio::init(ENV['RDIO_KEY'], ENV['RDIO_SECRET']).tap do |rdio|
        rdio.session = @session
      end      
    end    
  end
end