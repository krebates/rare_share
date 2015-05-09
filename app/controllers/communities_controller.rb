class CommunitiesController < ApplicationController

  def index
    @membership = Membership.new 
    if params[:query].present?
      @communities = Community.search(params[:query])
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
      flash[:success] = "Your community was created successfully."
      redirect_to community_path(@community)
    else
      flash[:error] = "Your community was not created. Please try again."
      redirect_to root_path
    end
  end

  def update
    @community = Community.find(params[:id])
    @community.update_attributes!(community_params)
    if @community.save
      flash[:success] = "Your community was updated successfully."
      redirect_to community_path(@community)
    else
      flash[:error] = "Your community was not updated. Please try again."
      redirect_to root_path
    end

  end

  def edit
    @community = Community.find(params[:id])
  end


  private

  def community_params
    params.require(:community).permit(:name, :description, :name, :description, :created_at, :updated_at, :prevalence , :cause , :diagnosis, :symptom, :diagnostic_test, :treatment, :prognosis, :tip, :expanded_description)
  end

end
