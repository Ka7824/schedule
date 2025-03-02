class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :start_datetime, :end_datetime, :is_all_day, :memo))
    if @post.save
      flash[:success] = "スケジュールを登録しました"
      redirect_to :posts
    else
      flash.now[:error] = "スケジュールの登録に失敗しました"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :start_datetime, :end_datetime, :is_all_day, :memo))
      flash[:success] = "スケジュールを更新しました"
      redirect_to :posts
    else
      flash.now[:error] = "スケジュールの更新に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "スケジュールを削除しました"
      redirect_to :posts
    else
      flash[:error] = "スケジュールの削除に失敗しました"
      redirect_to :posts
    end
  end

end