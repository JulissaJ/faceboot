class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = @post.user_id

    if @comment.save
      redirect_to post_path(@post),
      notice: 'Comment was successfully added'
    else
      flash[:notice] = 'Fields can\'t be blank'
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
