require 'lastfm/session'
require 'lastfm/errors'

describe LastFM::Session do
  
  context 'when we have a valid user token' do
    it 'we return the service connection' do
      lastfm = LastFM::Session.new('foo')
      lastfm.connection.should be_a(Lastfm)
    end
    
    it 'we can ask for the user session' do
      lastfm = LastFM::Session.new('foo')
      lastfm.connection.session.should eql('foo')
    end
      
  end
  
  context 'when we have an invalid user token'
  
  context 'when we do not have the user token' do    
    it 'an error is raised' do
      expect { LastFM::Session.new() }.to raise_error(LastFM::NoUserSession)
    end
  end

end
