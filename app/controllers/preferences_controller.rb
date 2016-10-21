class PreferencesController < ApplicationController

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new(preferences_params)
    if @preference.save
      # redirect_to where???? back to usergroup show page?
      flash[:notice] = "Preferences updated"
    else
      flash[:notice] = @preference.errors.full_messages.join(", ")
    end
  end

  private


   def preferences_params
     params.require(:preference).permit(:user, :usergroup, :find, :location, :category)
   end

end
