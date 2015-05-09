class MembershipsController < ApplicationController
  def create
    @membership = Membership.new(membership_params)
    if @membership.save
      flash[:success] = "You have successfully joined this community."
      redirect_to community_path(membership_params[:community_id])
    else
      flash[:error] = "There was an error. Could not join community, try again."
      redirect_to :back
    end
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy!
    redirect_to :back
  end

  private

  def membership_params
    params.permit(:community_id, :user_id)
  end
end
