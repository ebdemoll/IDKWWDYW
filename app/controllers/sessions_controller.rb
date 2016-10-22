class SessionsController < ApplicationController
  def new
    @token = params[:invite_token]
    session[:token] = @token
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    @token = params[:invite_token]
    session[:token] = @token
    if user && user.authenticate(params[:session][:password])
      if session[:token] != nil
         org =  Invite.find_by_token(session[:token]).usergroup #find the user group attached to the invite
         @membership = Membership.new(user_id: current_user.id, usergroup_id: org.id)
         @membership.save
         flash[:notice] = "You joined the group you were invited to!"
      end
      redirect_to usergroups_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render :new
    end

  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end
end
