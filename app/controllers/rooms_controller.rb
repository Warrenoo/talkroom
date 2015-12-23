class RoomsController < ApplicationController
  before_action :find_room, only: :show

  def index
    @rooms = Room.all
  end

  def show
    @messages = @room.messages.last(5)
    @has_more = @room.messages.count > 5
  end

  private
  def find_room
    @room = Room.find(params[:id])
  end
end
