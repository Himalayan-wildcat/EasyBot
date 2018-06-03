json.array! @chats do |chat|
  json.user_input          chat.keyword
  json.response_timestamp  chat.created_at
end
