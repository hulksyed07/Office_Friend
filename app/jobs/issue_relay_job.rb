class IssueRelayJob< ApplicationJob
  queue_as :default

  def perform(issue)
    # Do something later
  	ActionCable.server.broadcast "issues",
  	issue: IssuesController.render(partial: 'issues/issue', locals: {issue: issue})
  end
end
