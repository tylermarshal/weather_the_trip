class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_trip
    # @current_trip ||=
    # create new trip and then edit the trip with new destiantions
  end
end
