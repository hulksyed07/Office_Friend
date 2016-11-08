App.issues = App.cable.subscriptions.create "IssuesChannel",
  collection: -> $("[data-channel='issues']")

  connected: ->
    # FIXME: While we wait for cable subscriptions to always be finalized before sending messages
    setTimeout =>
      @followIssues()
      @installPageChangeCallback()
    , 1000

  received: (data) ->
    # @collection().append(data.issue) #unless @userIsCurrentUser(data.issue)
    $("[data-channel='issues'] tbody").append(data.issue)

  # userIsCurrentUser: (message) ->
  #   $(message).attr('data-user-id') is $('meta[name=current-user]').attr('id')

  followIssues: ->
    if @collection()
      @perform 'follow'
    else
      @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.issues.followIssues()