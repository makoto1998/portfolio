class RoomsController < ApplicationController
  def show
    @messages = Message.all
    # @messages = @message
  end
end
