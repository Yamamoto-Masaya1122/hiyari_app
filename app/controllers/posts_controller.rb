class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  
  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
