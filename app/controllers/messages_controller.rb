class MessagesController < ApplicationController
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
    params[:sender] = current_user
    params.permit(:sender, :recipient, :content)
  end
end
