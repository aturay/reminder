class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  after_action :set_send_mail_date, only: [:create, :update]

  # GET /notes
  def index
    @notes = Note.where user: current_user
  end

  # GET /notes/1
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to root_path, notice: t('.success')
    else
      render :new
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      redirect_to root_path, notice: t('.success')
    else
      render :edit
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
    redirect_to notes_url, notice: t('.success')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      permitted = params.require(:note).permit(:text, :send_time, :interval_count, :interval_type)
      permitted['user_id'] = current_user.id
      permitted
    end

    def set_send_mail_date
      @note.set_next_time
      NoteMailer.note(@note, current_user).deliver_later(wait_until: @note.send_time)
    end
end
