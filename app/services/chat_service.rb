class ChatService

  def index(params)
    @applications = Chat.where(application_id: params[:application_uuid]).paginate(:page => params[:page], :per_page => 10)
  end

  def create(application_uuid)
    InsertChat.perform_later(application_uuid)
    @chat = Chat.get_chat_number(application_uuid, false )
  end
end