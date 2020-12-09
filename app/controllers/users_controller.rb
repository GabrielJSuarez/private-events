class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'User was created successfully'
      redirect_to user_path(@user)
    else
      flash[:danger] = 'Please enter a valid name'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @user_past_events_host = @user.created_events.past_events.order('created_at DESC')
    @user_upcoming_events_host = @user.created_events.upcoming_events.order('created_at DESC')
    @user_past_events_attendee = @user.attended_events.past_events.order('created_at DESC')
    @user_upcoming_events_attendee = @user.attended_events.upcoming_events.order('created_at DESC')
  end

  private

  def users_params
    params.require(:user).permit(:name)
  end
end
