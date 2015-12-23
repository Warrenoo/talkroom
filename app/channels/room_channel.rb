class RoomChannel < ApplicationCable::Channel
  def subscribed
    current_user.room_id = params[:room_id]
    stream_from "room_channel_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    current_user&.room&.messages&.create! content: data['message'], nickname: current_user.nickname, ip: current_user.ip
  end
end
