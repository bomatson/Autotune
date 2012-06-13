class UsersController < ApplicationController
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end
  
  #def post_to_twitter(post)
  #   client = Twitter::Base.new(oauth)
  #   client.update(post)
  # end
  
  def tweet
      # Exchange our oauth_token and oauth_token secret for the AccessToken instance.
      @access_token = prepare_access_token(current_user.token, current_user.secret)

      @response = @access_token.request(:post, "http://api.twitter.com/1/statuses/update.json", :status => "Tweet pela API")

      render :html => @response.body
  end
end
