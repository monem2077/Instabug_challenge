json.chats do |chatsElement|
  chatsElement.array!(@chats) do |chat|
    json.extract! chat, :number, :messages_count
  end
end
json.current_page @chats.current_page
json.total_pages @chats.total_pages
