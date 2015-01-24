class DiscussionsController < ApplicationController
  def new
  end

  def create
    @community = Community.find(params[:community_id])
    @community.discussions.create(discussion_params)
    redirect_to :back
  end

  def show
    @community = Community.find(params[:community_id])
    @discussion = Discussion.find(params[:id])
  end


  private

  def discussion_params
    params.require(:discussion).permit(:title, :subject)
  end

end
