class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      respond_to do |format|
        format.html {redirect_to @post, notice: 'Post was successfully added'}
        format.js
      end
    else
      flash[:notice] = 'Post or title can\'t be blank'
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if post_params
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  protected

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
