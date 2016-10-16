class MembershipsController < ApplicationController
  def index
  end

  def show
  end
  
  def new
    @usergroup = Usergroup.find(params[:usergroup_id])
    @membership = Membership.new
  end

  def create
    @usergroup = Usergroup.find(params[:usergroup_id])
    @membership = Membership.new(membership_params)
  end

  private

  def membership_params
      params.require(:membership).permit(:usergroup_id, :user_id)
  end
end
