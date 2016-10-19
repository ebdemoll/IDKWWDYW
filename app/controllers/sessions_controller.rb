class SessionsController < ApplicationController
  def new
    session[:token]
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    @token = session[:token]
    if @token != nil
       org =  Invite.find_by_token(@token).usergroup #find the user group attached to the invite
       @membership = Membership.new(user_id: current_user.id, usergroup_id: org.id)
       @membership.save
       flash[:notice] = "You joined the group you were invited to!"
    end

    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
