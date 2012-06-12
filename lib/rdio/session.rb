require 'rdio'
require 'omniauth-rdio'

module Rdio
  class Session
    
    def initialize(session = nil)#, username)
      raise NoUserSession if session.nil?
      @session = session
    end

  private
    def create_rdio_connection
      Rdio::init(ENV['RDIO_KEY'], ENV['RDIO_SECRET']).tap do |rdio|
        rdio.session = @session
      end      
    end    
  end
end