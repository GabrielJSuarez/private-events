class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && !user.nil?
      session[:user_id] = user.id
      flash[:success] = 'You have successfully logged in'
      redirect_to user_path(user)
    else
      flash[:danger] = 'Wrong name'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have logged out!'
    redirect_to login_path
  end
end
