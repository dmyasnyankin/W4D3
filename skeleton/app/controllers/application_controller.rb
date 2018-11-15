class ApplicationController < ActionController::Base
  def login!
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end
  
  def logout!
    
  end
  
  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end
end
