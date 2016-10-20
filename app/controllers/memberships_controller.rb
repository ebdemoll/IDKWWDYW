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


end
