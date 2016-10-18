# frozen_string_literal: true
class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @token = params[:invite_token] #<-- pulls the value from the url query string
    @user = User.new
  end

  def create
    @newUser = build_user(user_params)
    @newUser.save
    @token = params[:invite_token]
    if @token != nil
       org =  Invite.find_by_token(@token).user_group #find the user group attached to the invite
       @newUser.user_groups.push(org) #add this user to the new user group as a member
    end
    flash[:notice] = "Successfully joined group!"
    redirect_to usergroups_path
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end
