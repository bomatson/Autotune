require 'lastfm/artists'
require 'lastfm/errors'

describe LastFM::Artists do
  describe '.get_artists_for' do
    it 'asks the lastfm service for artists' do
      Lastfm::MethodCategory::User.any_instance.should_receive(:get_top_artists).with('mighty_penguin')
      LastFM::Artists.get_artists_for('mighty_penguin')
    end
    
    it 'will return a normailzed array of artists' 
    # basically the return from this method should look the same in here and
    # SoundCloud::Artists.get_artists_for(username) so that any class that interfaces
    # with these two can expect the same data 
  end
end
