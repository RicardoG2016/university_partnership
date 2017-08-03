class GroupsController < ApplicationController

# for use with gov api to get school lists
# ENV['GOV_EDU_API']
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
  end

  def edit
    @group = Group.find(params[:id])
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
    @group = Group.find(params[:id])

    if @group.update(group_params)
      redirect_to @group
    else
      render 'new'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:university, :password, :phone, :email, :president, :member_count)
  end


end
