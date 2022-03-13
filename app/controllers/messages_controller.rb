class MessagesController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @messages = Message.all
    @friend = User.find(params[:id])
    respond_to do |format|
      format.html { redirect_to message_path(@recipient.id) }
      format.js { }
    end
  end

  def create
    @message = Message.new(permit_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to '/' }
        format.js { }
      end
    else
      puts '='*60
      puts params
    end
  end

  private

  def permit_params
    params[:sender_id] = current_user.id
    params.permit(:sender_id, :recipient_id, :content)
  end
end
