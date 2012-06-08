class StaticPagesController < ApplicationController
  # before_filter :authenticate_user!, :except => [:home, :about]
  
  def home
  end

  def about
  end
end
