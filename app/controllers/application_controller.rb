class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_valid_session

  ### authentication:
  helper_method :authenticated?, :session_user, :session_user_id

  def check_valid_session
    begin
      if session[:user_id] and session_user.nil?
        session.clear
        flash[:warning] = "Your session has expired"
      end
    rescue
      logout_user
    end
  end

  # returns true if the currently accessed user account is the same as the session user
  def is_session_user?
    id_or_username = params[:user_id]
    case id_or_username
      # if the id/username is for the current user, or the id is not provided then use the current user
      when session_user_id, nil
        true
      else
        false
    end
  end

  def authenticated?
    !session_user_id.blank?
  end

  def session_user
    @session_user ||= User.find(session[:user_id]) if authenticated?
  end

  def session_user_id
    session[:user_id]
  end

  # ensures that the user is authenticated
  def authenticate_user!(options = {})
    defaults = {
        return_to: request.original_url,
        controller: :session,
        action: :twitter,
        raise_exception: false

    }

    defaults.merge!(options)
    options = defaults;

    if authenticated?
      true
    elsif options[:raise_exception]
      raise "User is not authenticated"
    else
      session[:return_to] = options[:return_to]
      redirect_to '/auth/twitter'
      false
    end
  end

  def login_user(user)
    # this is the one value we need to retain from the session after we reset it
    return_to = session[:return_to]
    update_session(user)
    session[:return_to] = return_to
  end

  def update_session(user = session_user)
    reset_session
    @session_user = user
    refresh_session
  end

  def refresh_session
    session[:user_id] = @session_user.id
    session[:twitter_id] = @session_user.twitter_id
    session[:twitter_name] = @session_user.twitter_name
    session[:rdio_id] = @session_user.rdio_id
  end

  def logout_user
    reset_session
    @session_user = nil
  end

  #
  # Returns to the "return_to" url stored within the query string or session. Returns true if there was a return_to
  # url to return to, otherwise false. Callers should check for false and do their own redirection, or pass in a default_return_to value
  #
  def return_to_url(default_return_to = nil, options = {})
    return_to = params[:return_to] || session[:return_to] || default_return_to
    if !return_to.blank?
      session[:return_to] = nil
      redirect_to return_to, options
      true
    else
      false
    end
  end
  
  # def post_to_twitter(post)
  #   oauth = Twitter::OAuth.new('consumer token', 'consumer secret')
  #   oauth.authorize_from_access('access token', 'access secret')
  #   client = Twitter::Base.new(oauth)
  #   client.update(post)
  # end
end
