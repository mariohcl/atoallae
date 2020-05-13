class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  skip_authorization_check

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @profiles = Profile.all
  end

  # GET /events/new
  def new
    @event = Event.new
    @page = Page.find(params[:page_id])
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @page = Page.find(params[:page_id])
  end

  def my_events
    @my_events = current_user.events
  end

  def like
    @event = Event.find(params[:id])
      if current_user.liked? @event
        @event.unliked_by current_user
      else
        @event.liked_by current_user
      end
    redirect_to page_event_path(@event.page, @event)
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.page = Page.find(params[:page_id])

    respond_to do |format|
      if @event.save
        format.html { redirect_to page_event_path(@event.page, @event), notice: 'Event was successfully created.' }
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
        format.html { redirect_to page_event_path(@event.page), notice: 'Event was successfully updated.' }
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
      format.html { redirect_to page_events_path, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :description, :place, :date, :eventimage, :map)
    end
end
