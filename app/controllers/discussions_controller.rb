class DiscussionsController < ApplicationController
  def new
  end

  def create
    @community = Community.find(discussion_params[:community_id])
    @community.discussions.create(discussion_params)
    redirect_to :back
  end

  def show
    @discussion = Discussion.find(params[:id])
  end


  private

  def discussion_params
    params.require(:discussion).permit(:title, :subject, :user_id, :community_id, :created_at, :updated_at)
  end
end
