class MessageRelayJob < ApplicationJob
  def perform(message)
    ActionCable.server.broadcast "issues:#{message.issue_id}:messages",
      message: IssuesController.render(partial: 'messages/message', locals: { message: message })
  end
end