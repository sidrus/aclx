class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :check_role, except: [:index, :show]

  # GET /events
  # GET /events.json
  def index
    if(params[:show_unpublished])
      @events = Event.unpublished_upcoming_events
    else
      @events = Event.upcoming_events
    end

    @mappable_events = @events.select {|e| e.has_mappable_location?}

    @hash = Gmaps4rails.build_markers(@mappable_events) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.infowindow event.title.titleize
    end
  end

  def allevents
    @events = Event.all.order(:start)
    render :index
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.admin = current_admin

    # default value for :published
    params[:published] ||= false

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_url, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def check_role
      unless current_admin.has_role?(:event_coordinator)
        redirect_to events_url, :flash => {error: "You must be an event coordinator to perform that action."}
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :location, :start, :end, :poc, :published)
    end
end
