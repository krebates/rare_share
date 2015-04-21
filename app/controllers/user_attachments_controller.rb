class UserAttachmentsController < ApplicationController
  def create
    @user = User.find(user_attachment_params[:user_id])

    user_attachment_params[:avatar].each do |image|
      @user_attachment = @user.user_attachments.create!(:avatar => image, :attachment_type => attachment_type, :user_id => @user.id)
    end

    if @user.save
      flash[:success] = "Your image was saved successfully." 
      redirect_to profile_path(@user)
    else
      flash[:error] = "Your image was not saved successfully. Please try again." 
      redirect_to profile_path(@user)
    end
  end

  private

  def attachment_type
    user_attachment_params[:attachment_type]
  end

  def user_attachment_params
    params.require(:user_attachment).permit(:attachment_type, :user_id, avatar: [])
  end
end
