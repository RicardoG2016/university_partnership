class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :delete] 

def index
  @post = Post.all
end

def show
  # @post = Post.find(params[:id])
end

def new
  @post = Post.new
end

def edit
  # @post = Post.find(params[:id])
end

def create
  @post = Post.new(post_params)

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

def delete
  # @post = Post.find(params[:id])

  @post.destroy
  redirect_to '/'
end

private

def find_post
  @post = Post.find(params[:id])
end


def post_params
  params.require(:post).permit(:title, :body)
end



end
