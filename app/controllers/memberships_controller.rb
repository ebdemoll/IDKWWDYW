# frozen_string_literal: true
class MembershipsController < ApplicationController
  def index
  end

  def create
    membership = Membership.new(usergroup_id: session[:uid], user_id: current_user.id)
    session[:uid] = nil
    membership.save
    flash[:notice] = "Group joined successfully"
    redirect_to usergroups_path
  end


end
