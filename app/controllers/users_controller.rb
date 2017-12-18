class UsersController < ApplicationController

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = "Created #{@user.username}"
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      render :new
    end
  end

end
