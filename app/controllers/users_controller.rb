class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if user.save
      flash[:success] = 'User was created successfully'
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show; end

  private

  def users_params
    params.require(:user).permit(:name)
  end
end
