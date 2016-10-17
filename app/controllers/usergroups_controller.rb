# frozen_string_literal: true
class UsergroupsController < ApplicationController
  def index
    @membership = Membership.find_by(user_id: current_user.id)
    unless @membership.nil?
        @usergroups = []
        @usergroups << Usergroup.find_by(id: @membership.usergroup_id)
    end
  end

  def new
    @usergroup = Usergroup.new
  end

  def create
    @usergroup = Usergroup.new(usergroup_params)
    if @usergroup.save
      redirect_to new_usergroup_membership_path(@usergroup)
      flash[:notice] = "Group added successfully"
    else
      flash[:notice] = @usergroup.errors.full_messages.join(", ")
      render :new
    end
  end
  def show
    @usergroup = Usergroup.find(params[:id])
    @membership = Membership.find_by(usergroup_id: @usergroup.id)
    if @membership.user_id == current_user.id
      @members = []
      @members << User.find_by(id: @membership.user_id)
    else
      redirect_to usergroups_path
      flash[:notice] = "You Do Not Belong to That Group"
    end
  end

 private

 def usergroup_params
   params.require(:usergroup).permit(:name, :user)
 end

end
