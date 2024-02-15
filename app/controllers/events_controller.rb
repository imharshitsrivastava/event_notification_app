require_relative '../../lib/iterable_client'

class EventsController < ApplicationController
  before_action :authenticate_user!

  # GET events
  def index
    @events = current_user.events
  end

  # GET event
  def show
  end


  # GET /events/new
  def new
    create
  end

  # create event
  def create
    iterable_service.create_event(current_user.id, params[:event_type])
    respond_to do |format|
      @event = Event.find_or_initialize_by(user_id: current_user.id, name: "Event #{params[:event_type]}") if params[:event_type].present?
      if @event && @event.save
        # iterable_client = IterableClient.new(ENV['ITERABLE_API_KEY'])
        # iterable_client.send_event(@event.name, current_user.id, {})
        # iterable_client.send_email(current_user.email, "Your event notification", "Event B") if @event.name.eql?("Event B")
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :user_id)
    end

    def iterable_service
      @iterable_service ||= IterableService.new
    end
end
