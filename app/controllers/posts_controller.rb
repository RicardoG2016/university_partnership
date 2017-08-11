class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote] 
  before_action :authenticate_group!

def search
  if params[:search].present?
    @event = Event.search(params[:search])
    @post = Post.search(params[:search])
    @group = Group.search(params[:search])
  else
    @event = Event.all
    @post = Post.all
    @group = Group.all
  end
end

def index
  @post = Post.all.order("created_at DESC")
end

def show
  # without devise
  # @post = Post.find(params[:id])
  @comments = Comment.where(post_id: @post)
end

def new
  # without devise
  # @post = Post.new
  @post = current_group.posts.build
end

def edit
  # @post = Post.find(params[:id])
end

def create
  # without devise
  # @post = Post.new(post_params)
  @post = current_group.posts.build(post_params)

  if @post.save
    redirect_to @post
  else
    render 'new'
  end
end

def update
  # @post = Post.find(params[:id])
  if @post.update(post_params)
    redirect_to @post
  else
    render 'edit'
  end
end

def destroy
  # @post = Post.find(params[:id])
  @post.destroy
  redirect_to '/'
end

def upvote
  # binding.pry
  @post.upvote_by current_group
  puts "Post id:#{@post.id} vote count is now #{@post.get_upvotes.size} -upvote-"
  redirect_back(fallback_location: root_path)
end

def downvote
  @post.downvote_by current_group
  puts "Post id:#{@post.id} vote count is now #{@post.get_upvotes.size} -downvote-"
  redirect_back(fallback_location: root_path)
end

private
def find_post
  @post = Post.find(params[:id])
end

def post_params
  params.require(:post).permit(:body)
end

end
