class User < ActiveRecord::Base
  # before_action :authenticate_user!
  has_many :roles
  has_many :memberships
  has_many :communities, through: :memberships
  has_many :posts


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def user_roles
    return unless roles.any?
    roles.map(&:name)
  end
end
