class CommentsController < ApplicationController
  before_action :authenticate_group!

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create(params[:comment].permit(:content))
    @comment.group_id = current_group.id
    @comment.post_id = @post.id

  if @comment.save
    redirect_to post_path(@post)
  else
    render 'new'
  end

  end

end
