class PreferencesController < ApplicationController

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new(preferences_params)
    @usergroupshow = Usergroup.find(session[:ugid])
    if @preference.save
      redirect_to usergroup_path(@usergroupshow)
      flash[:notice] = "Preferences updated"
    else
      flash[:notice] = @preference.errors.full_messages.join(", ")
      redirect_to usergroup_path(@usergroupshow)
    end
  end

  private


   def preferences_params
     params.require(:preference).permit(:user_id, :usergroup_id, :find, :location, :category)
   end

end
