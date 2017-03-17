App.comments = App.cable.subscriptions.create "CommentsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $("#messages").prepend(data)
    #$("#messages .comment-fix:first").prepend(data)
    # Called when there's incoming data on the websocket for this channel
    
    #send_message: (message, Comment_id) ->
    #@perform 'send_message', message: message, Comment_id: Comment_id

