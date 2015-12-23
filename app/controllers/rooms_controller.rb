class RoomsController < ApplicationController
  def show
    @messages = Message.last(5)
    @has_more = Message.count > 5
  end
end
