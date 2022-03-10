class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def create
    @note = Note.new(permit_params)

    if @note.save
      respond_to do |format|
        format.html { redirect_to notes_path }
        format.js { }
      end
    else
      render notes_path
      flash[:danger] = "Oh No ! We couldn't save your note ..."
    end
  end

  def update
    Note.all.find(params[:id]).update(completed: params.permit(:completed))
  end

  def destroy
    Note.all.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to notes_path }
      format.js { }
    end
  end

  private 

  def permit_params
    params[:completed] = false
    params.permit(:title, :content, :completed)
  end
end
