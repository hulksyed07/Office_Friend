# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class IssuesChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "issues"
  end

  def unfollow
    stop_all_streams
  end
end
