class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comments"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
  def receive(data)
    ActionCable.server.broadcast "comments", render(partial: 'comments/comment', object: @comment)
  end
end
