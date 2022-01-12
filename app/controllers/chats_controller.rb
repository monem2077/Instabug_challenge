class ChatsController < ApplicationController

  def initialize
    @chat_service = ChatService.new
    @application_service = ApplicationService.new
  end


  def index
    @chats = @chat_service.index(params)
  end

  def create
    unless @application_service.is_application_exists(params[:application_uuid])
      render json: { message: "Validation failed", errors: 'Application Not Found' }, status: 404
    end
    @chat = @chat_service.create(params[:application_uuid])
  end
end
