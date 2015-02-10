class SupplementsController < ApplicationController
  def new
  end

  def create
    @community = Community.find(params[:community_id])
    @community.supplements.create(supplement_params)
    redirect_to :back
  end

  def show
    @community = Community.find(params[:community_id])
    @supplement = Supplement.find(params[:id])
  end


  private

  def supplement_params
    params.require(:supplement).permit(:title, :description, :link)
  end

end
