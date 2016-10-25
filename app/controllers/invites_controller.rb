# frozen_string_literal: true
class InvitesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @usergroup_id = session[:ugid]
    @invite = Invite.new
  end

  def create
      @invite = Invite.new(invite_params)
      recipient = User.find_by(email: @invite.email)
      @invite.sender_id = current_user.id
      if @invite.save
        if recipient.nil?
         InviteMailer.new_user_invite(@invite, root_path(:invite_token => @invite.token)).deliver_now
         flash[:notice] = "Invite Sent"
         redirect_to usergroups_path
        else
          InviteMailer.returning_user_invite(@invite, root_path(:invite_token => @invite.token)).deliver_now
          flash[:notice] = "Invite Sent"
          redirect_to usergroups_path
        end
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
