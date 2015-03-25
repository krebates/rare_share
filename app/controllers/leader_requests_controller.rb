class LeaderRequestsController < ApplicationController
  def create
    ::LeaderRequestMailer.new(leader_request_params, current_user).send
    redirect_to :back
  end

  private

  def leader_request_params
    params.require(:leader_request).permit(:community_id, :body, :sender_id)
  end
end

