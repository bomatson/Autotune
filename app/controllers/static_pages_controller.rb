class StaticPagesController < ApplicationController
   before_filter :authenticate_user!, :except => [:home, :about]
  
  def home
    render template: 'static_pages/iwantto'
  end

  def tweet_this

    render template: 'static_pages/tweetthis'
    
  end

  def about
  end


end
