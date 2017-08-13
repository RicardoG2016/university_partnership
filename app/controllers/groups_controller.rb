class GroupsController < ApplicationController
  before_action :find_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_group!

# for use with gov api to get school lists
# ENV['GOV_EDU_API']
  
  # def search
  #   if params[:search].present?
  #     @group = Group.search(params[:search])
  #   else
  #     @group = Group.all
  #   end
  # end

  def index
    @groups = Group.all.order('created_at DESC')
  end

  def show
    # @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def edit
    # @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to @group
    else
      render 'new'
    end
  end

  def update
    # @group = Group.find(params[:id])

    if @group.update(group_params)
      redirect_to '/'
    else
      render 'edit'
    end
  end

  def destroy
    # @group = Group.find(params[:id])
    @group.destroy

    redirect_to groups_path
  end

  private

  def find_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:university, :password, :phone, :email, :president, :member_count)
  end

end
