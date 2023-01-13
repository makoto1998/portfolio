class PostsController < ApplicationController
  def new
    @post = Post.new
    @posts = Post.all
  end

  def index
    @posts = Post.all.order(created_at: 'desc')
    @user = User.find_by(params[:id])
    @user = current_user
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to '/posts/new'
    else
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    # 編集ページの送信ボタンから飛んできたときのparamsに格納されたidを元に、該当する投稿データを探して、変数に代入する
    if @post.update(post_params)
      redirect_to post_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      redirect_to posts_path, notice: "投稿を削除しました"
    else
      flash.now[:danger] = '削除に失敗しました。'
      render 'show'
    end
  end


  private
  def post_params
    params.require(:post).permit(:title, :body).merge(user_id: current_user.id)
  end
end
