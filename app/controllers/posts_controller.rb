class PostsController < ApplicationController
  before_action :set_params, :only => [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render "new"
    end
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy

    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
  def set_params
    @post = Post.find(params[:id])
  end
end
