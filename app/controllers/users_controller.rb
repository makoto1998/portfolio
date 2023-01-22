class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :index]
  before_action :admin_user,     only: :destroy

  def new
    @user = User.new
  end

  def index
    @users = User.all.order(created_at: :desc)
    @user = User.find(params[:id])
    @posts = Post.all.order(created_at: 'desc')
    # @posts = Post.where(user_id: current_user.id).includes(:user).order("created_at DESC")    #投稿
  end

  # マイページ
  def show
    @user = User.find([:id])
    @user = current_user
    @posts = Post.where(user_id: current_user.id).includes(:user).order("created_at DESC")    #投稿タイトルを表示
  end


  def update
    @user = User.find(params[:id])
    @user.save
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  # 管理者かどうか確かめる
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  private

  def set_user
    @user = User.find_by(params[:id])
  end

end
