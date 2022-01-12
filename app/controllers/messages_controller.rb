class MessagesController < ApplicationController

  def initialize
    @message_service = MessageService.new
  end

  def create
    @message = @message_service.create(params[:application_uuid],params[:chat_number], message_params[:message])
  end

  def search
    @messages = @message_service.search(params)
  end

  def message_params
    params.require(:message).permit(:message)
  end
end
