class EventNotesController < ApplicationController
  before_action :set_event_note, only: [:show, :edit, :update, :destroy]

  # GET /event_notes
  # GET /event_notes.json
  def index
    @event_notes = EventNote.all
  end

  # GET /event_notes/1
  # GET /event_notes/1.json
  def show
  end

  # GET /event_notes/new
  def new
    @event_note = EventNote.new
  end

  # GET /event_notes/1/edit
  def edit
  end

  # POST /event_notes
  # POST /event_notes.json
  def create
    @event_note = EventNote.new(event_note_params)

    respond_to do |format|
      if @event_note.save
        format.html { redirect_to @event_note, notice: 'Event note was successfully created.' }
        format.json { render :show, status: :created, location: @event_note }
      else
        format.html { render :new }
        format.json { render json: @event_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_notes/1
  # PATCH/PUT /event_notes/1.json
  def update
    respond_to do |format|
      if @event_note.update(event_note_params)
        format.html { redirect_to @event_note, notice: 'Event note was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_note }
      else
        format.html { render :edit }
        format.json { render json: @event_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_notes/1
  # DELETE /event_notes/1.json
  def destroy
    @event_note.destroy
    respond_to do |format|
      format.html { redirect_to event_notes_url, notice: 'Event note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_note
      @event_note = EventNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_note_params
      params.require(:event_note).permit(:title, :content, :admin_id, :event_id)
    end
end
