class Role < ActiveRecord::Base
  belongs_to :user

  private

  def role_params
    params.require(:role).permit(:name)
  end
end
