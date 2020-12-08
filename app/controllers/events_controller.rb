class EventsController < ApplicationController
  before_action :require_user, except: %i[index show]

  def index
    @events = Event.all.order('created_at Desc')
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = 'Event created successfully'
      redirect_to user_path(current_user)
    else
      flash[:danger] = 'Something went wrong'
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    session[:current_event] = @event.id
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :event_date, :description)
  end
end
