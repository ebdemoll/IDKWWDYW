class RecommendationsController < ApplicationController
  def index
    @recommendation = Recommendation.find_by(usergroup_id: session[:ugid])
    respond_to do |format|
      format.html
      format.json { render json: @yelp_data }
    end
  end

  def new
    @recommendation = Recommendation.new
  end

  def create
    @usergroup = Usergroup.find(session[:ugid])
    @chooser = User.find(@usergroup.chooser)
    if @usergroup.chooser.nil?
      @chooser = @usergroup.users.first
    else
      @usergroup.users.each do |user|
        if user.id != @usergroup.chooser
          @chooser = user
        end
      end
    @usergroup.update_attribute(:chooser, @chooser.id)
  end
    params = {
      term: @chooser.preferences[0].find,
      category_filter: ('restaurants'),
      limit: 1
    }
    @yelp_data = Yelp.client.search(@chooser.preferences[0].location, params)
    @yelp_data.businesses.each do |result|
      @name = result.name
      @phone = result.display_phone
      @address = result.location.display_address[0]
      @yelp_rating = result.rating
    end
    @recommendation = Recommendation.create(usergroup_id: @usergroup.id, name: @name, phone: @phone, address: @address, yelp_rating: @yelp_rating)
    redirect_to usergroup_path(@usergroup)
  end

end
