require 'rdio'

module Rdio
  class Playlist
    class << self
      
      def get_playlists_for(username)
        # Rdio::Playlist (ENV['RDIO_KEY'], ENV['RDIO_SECRET']).user.get_user_playlists(username)
      end
      
      def add_song_to_playlist(new_playlist)
        
      end
      
      # 
      # def main(args)
      # 
      #   argv = []
      #   argv << args.shift while not args.empty?
      # 
      #   user = Rdio::User.current
      #   
      #   songs = []
      # 
      #   if argv.empty?
      #     
      #     start = 0
      #     count = 10
      #     while true
      #       all = user.artists_in_collection start,count
      #       break if not all or all.empty?
      #       artists += all
      #       puts "Found #{all.length} artists, have #{artists.length}"
      #       start += count
      #     end
      #   else
      #     #
      #     # Otherwise, we assume the arguments are artist URLs
      #     #
      #     argv.each do |arg|
      #       all = []
      #       begin
      #         artist = Rdio::Artist.from_url arg
      #         all << artist if artist
      #       rescue Exception => e
      #         puts "Couldn't get artist #{arg} from url"
      #         puts e
      #       end
      #       if all.empty?
      #         begin
      #           artist = Rdio::Artist.from_short_code arg
      #           all << artist if artist
      #         rescue Exception => e
      #           puts "Couldn't get artist #{arg} from short code"
      #           puts e
      #         end
      #       end
      #       if all.empty?
      #         begin
      #           all = Rdio::Artist.search arg,nil,['name']
      #         rescue Exception => e
      #           puts e
      #         end
      #       end
      #       artists += all
      #       puts "Found #{all.length} artists, have #{artists.length}"
      #     end
      #   end
      #   
      #   artists.each do |artist|
      #     name = artist.name
      #     desc = "#{artist.name} All"
      #     tracks = user.tracks_for_artist_in_collection artist
      #     pl = Rdio::Playlist.create name,desc,tracks
      #     next if not pl
      #     puts "Added '#{pl.name}' with #{tracks.length} tracks"
      #   end
      
    end
  end
end
