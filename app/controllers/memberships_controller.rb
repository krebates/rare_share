class MembershipsController < ApplicationController

  def index
    @membership = Membership.all
    @user = current_user
  end

  def show
    @membership = Membership.find(params[:id])
  end

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(membership_params)
    @membership.user_id = current_user.id
    if @membership.save
      redirect_to root_path, notice: "You have joined this community"
    else
      redirect_to root_path, notice: "Couldn't join community"
    end
  end

private

def membership_params
  params.require(:membership).permit(:community_id, :user_id)
end


end
