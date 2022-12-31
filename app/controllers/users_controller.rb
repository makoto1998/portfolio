class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  def new
    @user = User.new
  end

  def index
    @users = User.all.order(created_at: :desc)
  end

  # マイページ
  def show
    @user = User.find(params[:id])
    @user = current_user
    @posts = Post.where(user_id: current_user.id).includes(:user).order("created_at DESC")    #投稿タイトルを表示
  end

  def update
    @user = User.find(params[:id])
    @user.save
  end

  private

  def set_user
    @user = User.find_by(params[:id])
  end
end
