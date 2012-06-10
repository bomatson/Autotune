class TunesController < ApplicationController
  def most_recent
    @tweet = ProcessedTweet.where('moods like ?', "%##{params[:mood]}%").first
  end
end