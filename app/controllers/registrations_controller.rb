class RegistrationsController < Devise::RegistrationsController
  def new
    @token = params[:invite_token] #<-- pulls the value from the url query string

    super
  end

  def create
    @newUser = User.new(user_params)
    @newUser.save
    @token = params[:invite_token]
    if @token != nil
       org =  Invite.find_by_token(@token).usergroup
       membership = Membership.new(usergroup_id: org.id, user_id: @newUser.id) #add this user to the new user group as a member
       membership.save
    end
    flash[:notice] = "You have successfully joined the group"
    redirect_to usergroups_path
  end

  def update
    super
  end


  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end
