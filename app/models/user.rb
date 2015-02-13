class User < ActiveRecord::Base
  acts_as_messageable
  # before_action :authenticate_user!
  has_many :roles
  has_many :memberships
  has_many :communities, through: :memberships
  has_many :posts


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  TITLES = %i[admin, expert]

  def user_roles
    return unless roles.any?
    roles.map(&:name)
  end

  def name
    "#{first_name} #{last_name}"
  end

  def mailerbox_email(object)
    email
  end

end
