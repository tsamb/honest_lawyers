class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def time_formatter(seconds)
    hours = seconds / 1.hour
    minutes = (seconds % 1.hour) / 1.minute
    "#{hours.floor} hours, #{minutes.floor} minutes"
  end

  def current_user
    User.find(session[:user_id])
    # User.find(1)
  end

  def logged_in?
    current_user != nil
  end
end
