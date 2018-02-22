class PostsController < ApplicationController
  
#  CRUD = create, read, update, destroy

  before_action :get_post, only: [:show, :edit, :update, :destroy]

  # view
  def index
    @posts = Post.all
  end

  # view
  def show
  end

  # view
  def new
    @post = Post.new
  end

  # used by new
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post has been created"
    else
      redirect_to new_post_path, notice: "There are some problems"
    end
  end

  # view
  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to(@post, {notice: "Post has been updated"})
    else
      redirect_to edit_post_path, notice: "There are some problems"
    end
  end

  def destroy
    if @post.destroy
      redirect_to(posts_url, {notice: "Post has been deleted"})
    else
      redirect_to posts_url, notice: "Failed to delete post"
    end
  end

  private

  def get_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
