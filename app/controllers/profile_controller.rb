class ProfileController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  # def update
  #   @user = User.find(params[:id])
  #   update_roles(@user) if user_params[:roles].present?
    # @user.update_attributes(user_params.except(:roles))

  #   redirect_to :back
  # end

  # def create
  #   @user = User.find(params[:id])
  #   @user_attachment = @user.user_attachments.build
  #   respond_to do |format|
  #     if @user.save
  #       params[:user_attachments]['avatar'].each do |a|
  #         @user_attachment = @user.user_attachments.create!(:avatar => a, :user_id => @user.id)
  #       end
  #       format.html { redirect_to @user, notice: 'user was successfully created.' }
  #     else
  #       format.html { render action: 'new' }
  #     end
  #   end
  # end

  def update
    @user = User.find(params[:id])


    update_roles(@user) if user_params[:roles].present?
    @user.update_attributes(user_params.except(:roles))

    @user_attachment = @user.user_attachments.build
    respond_to do |format|
      if @user.save
        params[:user_attachments]['avatar'].each do |a|
          @user_attachment = @user.user_attachments.create!(:avatar => a, :user_id => @user.id)
        end
        format.html { redirect_to @user, notice: 'user was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
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
    params.require(:user).permit(:bio, :city, :state, :country, :avatar, :first_name, :last_name, roles:[], users_attachments: [:id, :user_id, :avatar])
  end

end
