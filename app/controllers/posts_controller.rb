class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to @post, notice: "Post created successfully."
    else
      render :new
    end
  end

  def show
    @post = Post.find params[:id]
  end

  private

  def post_params
    params.require(:post).permit([:title, :link, :body, :category_id, :address, :image])
  end

end