class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_group!, except: [:index, :show]

  def index
    @events = Event.all.order('created_at DESC')
  end

  def show
    # @event = Event.find(event_params[:id])
  end

  def new
    # @event = Event.new
    @event = current_group.events.build
  end

  def edit
    # @event = Event.find(event_params[:id])
  end

  def create
    # @event = Event.new(event_params)
    @event = current_group.events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy

    redirect_to events_path
  end

  private
  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :date, :time, :description, :address)
  end
    
end
