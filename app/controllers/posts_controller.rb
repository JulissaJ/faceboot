class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post was successfully added'
      redirect_to posts_path
    else
      flash[:notice] = 'Post or title can\'t be blank'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
