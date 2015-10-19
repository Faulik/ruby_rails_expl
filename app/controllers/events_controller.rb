class EventsController < ApplicationController
  def index
    @events = Event.order('updated_at DESC').page params[:page]
  end

  def show
    @event = Event.find(params[:id])
    if stale?(@event)
      @comments = @event.comments.order('updated_at DESC').page params[:page]
      @tags = @event.tag_slugs
    end
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :address, :started_at)
  end
end
