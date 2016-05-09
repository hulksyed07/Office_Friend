json.array!(@messages) do |message|
  json.extract! message, :id, :chat, :sender_id, :reciever_id, :archived
  json.url message_url(message, format: :json)
end
