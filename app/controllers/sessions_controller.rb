class SessionsController < ApplicationController
  def new
    session[:token]
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    session[:user_id] = user.id
    @token = session[:token]
    if user && user.authenticate(params[:session][:password])
      if @token != nil
         org =  Invite.find_by_token(@token).usergroup #find the user group attached to the invite
         @membership = Membership.new(user_id: current_user.id, usergroup_id: org.id)
         @membership.save
         flash[:notice] = "You joined the group you were invited to!"
             redirect_to usergroups_path
      end
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
