class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatrooms"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
  def receive(data)
    #ActionCable.server.broadcast "chatrooms", render(partial: 'messages/message', object: @message)
    
    #ActionCable.server.broadcast "comments", render(partial: 'comments/comment', object: @comment)

   ActionCable.server.broadcast 'chatrooms', message: render_message(@message),
                                                        chef: @message.chef.chef_name

  end

end
