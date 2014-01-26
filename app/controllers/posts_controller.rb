class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :show, :destroy, :update]

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
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, notice: "Post updated successfully"
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: "Post deleted successfully."
    else
      redirect_to posts_path, alert: "Problem deleting post."
    end
  end


  private

  def find_post
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit([:title, :link, :body, :category_id, :address, :image])
  end

end