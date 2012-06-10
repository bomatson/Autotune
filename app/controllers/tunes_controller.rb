class TunesController < ApplicationController
  def most_recent
    @tweet = ProcessedTweet.where('moods like ?', "%##{params[:mood]}%").order("created_at desc").first
    @embed_url = @tweet.embed_url.gsub('https', 'http') if @tweet
    render template: 'tunes/player'
  end

  def random
    tweets = ProcessedTweet.where('moods like ?', "%##{params[:mood]}%").limit(100).all
    @tweet = tweets[rand(tweets.size)]
    @embed_url = @tweet.embed_url.gsub('https', 'http') if @tweet
    render template: 'tunes/player'
  end
end
