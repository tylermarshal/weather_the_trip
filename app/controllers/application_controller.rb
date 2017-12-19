class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?
  helper_method :current_admin?
  helper_method :current_trip

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def current_trip
    @current_trip ||= Trip.find(session[:trip_id]) if session[:trip_id]
    # create new trip and then edit the trip with new destiantions
  end
end
