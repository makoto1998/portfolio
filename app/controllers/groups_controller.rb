class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
    @group_lists = Group.all
    @group_joining = GroupUser.where(user_id: current_user.id)
    @group_lists_none = "グループに参加していません。"
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_url, notice: 'グループを作成しました。'
    else
      render :new
    end
    @group.user_ids = current_user.id
  end

  def show
    @group = Group.find(params[:id])
    @messages = Message.all
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path, notice: 'グループを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    delete_group = Group.find(params[:id])
      if delete_group.destroy
        redirect_to groups_path, notice: 'グループを削除しました。'
      end
  end

  def self.search(keyword)
    if keyword != ""
      Group.where('text LIKE(?)', "%#{keyword}%")
    else
      Group.all
    end
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :goal, user_ids: [])
    end
end
