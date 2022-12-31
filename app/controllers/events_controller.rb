class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.where(user_id: current_user.id).includes(:user).order("created_at DESC")
    @events = Event.where(user_id: current_user.id)
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(event_parameter)
    redirect_to root_path
  end

  private

  def event_parameter
    params.require(:event).permit(:title, :content, :start_time, :user_id)
  end
end
