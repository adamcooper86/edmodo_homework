class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize

  protected

  # Private: Ensures User is logged in.
  def authorize
    if not current_user
      redirect_to login_url
    end
  end

  # Private: Returns the current logged in User.
  def current_user
    @current_user ||= session[:user_id] && User.find(session[:user_id])
  end
  helper_method :current_user
end
