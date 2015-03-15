class CommunitiesController < ApplicationController

  def index
    if params[:query].present?
      @communities = Community.search(params[:query]).page params[:page]
    else
      @communities = Community.all.page params[:page]
    end
  end

  def show
    @community = Community.find(params[:id])
    @discussion = Discussion.new
    @supplement = Supplement.new
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    if @community.save
      redirect_to root_path, notice: "community created"
    else
      redirect_to root_path, notice: "community not created"
    end
  end

  private

  def community_params
    params.require(:community).permit(:name)
  end

end
