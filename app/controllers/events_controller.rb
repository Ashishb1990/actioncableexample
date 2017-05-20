class EventsController < ApplicationController
  def index
  	 @events = Event.all.reverse
  end

  def data_write
  	message = Event.create(message: "aaa")


  	# if message.save
   #    ActionCable.server.broadcast 'activity_channel',
   #      message: message.message
   #      # message_time: message.created_at.strftime("%H:%M"),
   #      # sender_code: message.sender.code,
   #      # receiver_code: message.receiver.code,
   #      # all_unread: Message.total_unread(message.receiver).count,
   #      # recipient_unread: Message.unread(message.sender, message.receiver).count
   #    head :ok
   #  end



  	# redirect_to '/events/index'
  end
end
