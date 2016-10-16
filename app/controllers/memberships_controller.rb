class MembershipsController < ApplicationController
    def index
    end

    def show
    end

    def new
      @usergroup = Usergroup.find(params[:usergroup_id])
      @membership = Membership.new({usergroup: @usergroup})
    end

    def create
      @membership = Membership.new(membership_params)
      if @membership.save
        redirect_to usergroups
        flash[:notice] = "Joined group successfully"
      else
        flash[:notice] = @membership.errors.full_messages.join(", ")
        render :new
      end
    end

    private

    def membership_params
        params.require(:membership).permit(:usergroup_id, :user_id)
    end
end
