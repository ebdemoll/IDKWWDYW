# frozen_string_literal: true
class InvitesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @usergroup_id = Usergroup.find(params[:id])
    @invite = Invite.new
  end

  def create
      binding.pry
      @invite = Invite.new(invite_params) # Make a new Invite
      @invite.sender_id = current_user.id # set the sender to the current user
      if @invite.save
         InviteMailer.new_user_invite(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver #send the invite data to our mailer to deliver the email
         redirect_to usergroups_path
      else
        flash[:notice] = "Invite Did NOT Send"
        redirect_to new_invite_path
      end
   end

  private

  def invite_params
    params.require(:invite).permit(:usergroup_id, :email)
  end
end
