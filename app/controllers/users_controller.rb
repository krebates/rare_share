class UsersController < Devise::RegistrationsController

  def index
    @users = User.all
  end

  def show  
    @user = User.find(params[:id])
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :dob)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :dob)
  end

end
