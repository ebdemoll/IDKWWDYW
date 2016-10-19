# frozen_string_literal: true
class InvitesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @usergroup_id = session[:uid]
    @invite = Invite.new
  end

  def create
      @invite = Invite.new(invite_params)
      @invite.sender_id = current_user.id
      # User find_by invite.email use if exists
      # if not, use sender object
      # if they respond, update recipient attribute
      binding.pry
      if @invite.save
         InviteMailer.new_user_invite(@invite, sessions_path(:invite_token => @invite.token)).deliver
         flash[:notice] = "Invite Sent"
         redirect_to usergroups_path
      else
        flash[:notice] = "Invite Did NOT Send"
        redirect_to usergroups_path
      end
   end

  private

  def invite_params
    params.require(:invite).permit(:usergroup_id, :email)
  end

end
