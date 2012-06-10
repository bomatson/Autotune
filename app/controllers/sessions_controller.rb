class SessionsController < ApplicationController
  
  def rdio
    @user = User.find_by(auth_hash)
    self.current_user = @user
    redirect_to '/'
  end
  
  def create

  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
  
end
