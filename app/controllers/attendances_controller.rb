class AttendancesController < ApplicationController
  before_action :require_user, only: %i[new create]
  def new
    @attendance = Attendance.new
    @event = Event.find(session[:current_event])
  end

  def create
    @attendance = Attendance.new
    @attendance.attendee = current_user
    @attendance.attended_event_id = session[:current_event]
    if @attendance.save
      flash[:success] = "#{current_user.name} will attend the event!"
      redirect_to events_path
    else
      flash[:danger] = 'Something went wrong'
      render 'new'
    end
  end
end