App.messages = App.cable.subscriptions.create "MessagesChannel",
  collection: -> $("[data-channel='messages']")

  connected: ->
    # FIXME: While we wait for cable subscriptions to always be finalized before sending messages
    setTimeout =>
      @followCurrentIssue()
      @installPageChangeCallback()
    , 1000

  received: (data) ->
    # @collection().append(data.message) #unless @userIsCurrentUser(data.message)
    $("[data-channel='messages'] tbody").append(data.message)

  # userIsCurrentUser: (message) ->
  #   $(message).attr('data-user-id') is $('meta[name=current-user]').attr('id')

  followCurrentIssue: ->
    if issueId = @collection().data('issue-id')
      @perform 'follow', issue_id: issueId
    else
      @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.messages.followCurrentIssue()