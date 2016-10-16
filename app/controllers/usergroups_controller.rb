# frozen_string_literal: true
class UsergroupsController < ApplicationController
  def index
    @membership= Membership.find_by(user_id: current_user.id)
    if @membership != nil
      @usergroup = Usergroup.find_by(id: @membership.usergroup_id)
    end
  end

  def new
    @usergroup = Usergroup.new
  end
  def create
    @usergroup = Usergroup.new(usergroup_params)
    @membership = Membership.new(user_id: current_user.id, usergroup_id: @usergroup.id)
    if @usergroup.save && @membership.save
      redirect_to usergroup_path(@usergroup)
      flash[:notice] = "Group added successfully"
    else
      flash[:notice] = @usergroup.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @usergroup = Usergroup.find(params[:id])
  end

 private

 def usergroup_params
   params.require(:usergroup).permit(:name, :user)
 end

end
