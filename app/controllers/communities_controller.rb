class CommunitiesController < ApplicationController

  def index
    @communities = Community.all
  end

  def show
    @community = Community.find(params[:id])
  end

  def new
    @community = Community.new
    @user = current_user
  end

  # def create
  #   @community = Community.new(community_params)
  #   if @community.save
  #     redirect_to api_applications_path, notice: t('flash.api_application.created')
  #   else
  #     redirect_to api_applications_path, alert: t('flash.api_application.unable_create')
  #   end
  # end

end
