class SessionsController < ApplicationController

def new
end

def create
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    flash.notice = "Welcome, #{current_user.username}!"
    redirect_to root_path
  else
    render :new
  end
end

end
