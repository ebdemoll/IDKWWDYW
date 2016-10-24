# frozen_string_literal: true
class UsergroupsController < ApplicationController
  def index
    @membership = Membership.find_by(user_id: current_user.id)
    unless @membership.nil?
        @usergroups = []
        @usergroups << Usergroup.find_by(id: @membership.usergroup_id)
    end
  end

  def show
    @preference = Preference.new
    @usergroup = Usergroup.find(params[:id])
    session[:ugid] = @usergroup.id
    userpreference = Preference.find_by(user_id: current_user.id)
    if userpreference.nil?
      @ready = false
    else
      @ready = true
    end
    users = @usergroup.users
    users.each do |user|
      if user.preferences.empty?
        @submit = false
        break
      else
        @submit = true
      end
    end
    @membership = Membership.find_by(usergroup_id: @usergroup.id)
    if @membership.user_id == current_user.id
      @memberships = []
      @memberships << User.find_by(id: @membership.user_id)
    else
      redirect_to usergroups_path
      flash[:notice] = "You Do Not Belong to That Group"
    end
    if @submit == true
      params = {
        term: current_user.preferences[0].find,
        category_filter: ('restaurants'),
        limit: 1
      }
      @user_1_data = Yelp.client.search(current_user.preferences[0].location, params)
    end
  end

  def new
    @usergroup = Usergroup.new
  end

  def create
    @usergroup = Usergroup.new(usergroup_params)
    if @usergroup.save
      session[:ugid] = @usergroup.id
      redirect_to '/memberships/create'
      flash[:notice] = "Group added successfully"
    else
      flash[:notice] = @usergroup.errors.full_messages.join(", ")
      render :new
    end
  end


  def edit
    @usergroup = Usergroup.find(params[:id])
    session[:ugid] = @usergroup.id
    @invite = Invite.new
  end

   private

   def usergroup_params
     params.require(:usergroup).permit(:name, :user)
   end

end
