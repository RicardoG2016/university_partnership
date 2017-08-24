class CommentsController < ApplicationController
  before_action :authenticate_group!
  before_action :find_comment, only: [:like, :unlike]

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

  def like
    current_group.like!(@comment)
    redirect_back(fallback_location: root_path)
  end

  def unlike
    current_group.unlike!(@comment)
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def find_comment
    @comment = Comment.find(params[:id])
  end
end
