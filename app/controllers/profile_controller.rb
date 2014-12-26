class ProfileController < ApplicationController
  def show
    @user = current_user 
    render 'users/profile/show'
  end

  def update
    role = Role.find(params[:user][:user_roles])
    current_user.roles << role
    redirect_to :back
  end
end
