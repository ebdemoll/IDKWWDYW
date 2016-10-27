class PreferencesController < ApplicationController

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new(preferences_params)
    @usergroupshow = Usergroup.find(session[:ugid])
    users = @usergroupshow.users
    if @preference.save
      all_preferences_submitted?(users)
      make_recommendation?
    else
      flash[:notice] = @preference.errors.full_messages.join(", ")
      redirect_to usergroup_path(@usergroupshow)
    end
  end

  def destroy
    @usergroup_id = session[:ugid]
    @usergroup = Usergroup.find(@usergroup_id)
    deletepreferences = Preference.where(usergroup_id: @usergroup_id)
    deletepreferences.each do |preference|
      preference.destroy
    end
    recommendation = Recommendation.where(usergroup_id: @usergroup_id)
    recommendation.each do |rec|
      rec.destroy
    end
    redirect_to usergroup_path(@usergroup)
  end

  private

   def preferences_params
     params.require(:preference).permit(:user_id, :usergroup_id, :find, :location, :category)
   end

   def all_preferences_submitted?(users)
     users.each do |user|
       if user.preferences.empty?
         @submit = false
         break
       else !user.preferences.empty? && @recommendation.nil?
         @submit = true
       end
     end
   end

   def make_recommendation?
     if @submit == true
       redirect_to '/recommendations/create'
     else
       redirect_to usergroup_path(@usergroupshow)
       flash[:notice] = "Preferences updated"
     end
   end
end
