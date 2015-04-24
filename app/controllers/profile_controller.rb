class ProfileController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    update_roles(@user) if user_params[:roles].present?
    @user.update_attributes(user_params.except(:roles))

    if @user.save
      flash[:success] = "Your information has been saved"
    else
      flash[:error] = "Your information has not been saved successfully, please try again"
    end

    redirect_to :back
  end

  private

  def update_roles(user)
    user.roles.clear
    role_ids.each do |role_id|
      role = Role.find(role_id)
      user.roles << role
    end
  end

  def role_ids
    @role_ids ||= params[:user][:roles].reject(&:blank?)
  end

  def user_params
    params.require(:user).permit(:bio, :city, :state, :country, :gender, :avatar, :first_name, :last_name, roles:[])
  end
end


