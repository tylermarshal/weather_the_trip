class UsersController < ApplicationController

  def show
    if current_user.id == params[:id].to_i
      render :show
    else
      render file: '/public/404'
    end
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

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end

end
