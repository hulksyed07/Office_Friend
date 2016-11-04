class MessagesChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "issues:#{data['issue_id'].to_i}:messages"
  end

  def unfollow
    stop_all_streams
  end
end