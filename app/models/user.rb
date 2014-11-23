class User < ActiveRecord::Base
  # before_action :authenticate_user!

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
