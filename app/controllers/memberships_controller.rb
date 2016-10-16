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
      @membership.save
      flash[:notice] = "Joined group successfully"
      redirect_to usergroups_path
    end

    private

    def membership_params
        params.require(:membership).permit(:usergroup_id, :user_id)
    end
end
