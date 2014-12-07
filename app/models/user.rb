class User < ActiveRecord::Base
  # before_action :authenticate_user!

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships
  has_many :communties, through: :memberships

end
