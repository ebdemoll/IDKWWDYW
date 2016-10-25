# frozen_string_literal: true
class MembershipsController < ApplicationController
  def index
  end

  def create
    membership = Membership.new(usergroup_id: session[:ugid], user_id: current_user.id)
    session[:ugid] = nil
    membership.save
    flash[:notice] = "Group made and joined successfully!"
    redirect_to usergroups_path
  end

  def destroy
    @user = User.find(current_user.id)
    @usergroup = session[:ugid]
    @memberships = Membership.where(user_id: current_user.id, usergroup_id: session[:ugid])
    @memberships.each do |membership|
      membership.destroy
    end
    redirect_to usergroups_path
  end

end
