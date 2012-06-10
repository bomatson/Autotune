require 'rdio/session'
require 'rdio/errors'

describe Rdio::Session do
  
  context 'when we have a valid user token' do
    it 'we return the service connection' do
      Rdio = Rdio::Session.new('foo')
      rdio.connection.should be_a(Rdio)
    end
    
    it 'we can ask for the user session' do
      Rdio = Rdio::Session.new('foo')
      rdio.connection.session.should eql('foo')
    end
      
  end
  
  context 'when we have an invalid user token'
  
  context 'when we do not have the user token' do    
    it 'an error is raised' do
      expect { Rdio::Session.new() }.to raise_error(Rdio::NoUserSession)
    end
  end

end
