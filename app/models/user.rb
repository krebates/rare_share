class User < ActiveRecord::Base
  default_scope { order('created_at DESC') }
  acts_as_messageable
  # before_action :authenticate_user!
  has_many :roles
  has_many :memberships
  has_many :connections
  has_many :connects, through: :connections
  has_many :inverse_connections, class_name: "Connections", foreign_key: "connection_id"
  has_many :inverse_connects, through: :inverse_connections, source: :user
  has_many :posts
  has_many :discussions

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_attachments
  accepts_nested_attributes_for :user_attachments

  TITLES = %i[admin, expert]

  def user_roles
    return unless roles.any?
    roles.map(&:name)
  end

  def communities
    memberships.map { |membership| membership.community }
  end

  def is_connected_to?(user)
    connections.map(&:connect_id).include?(user.id)
  end

  def connection_names
    connections.map(&:connect_id).map do |user_id|
      User.find(user_id).name
    end
  end

  #TODO fix .last
  def profile_photo
    profile_photos = user_attachments.where(attachment_type: "profile_photo")
    if profile_photos.last.present?
      profile_photos.last.avatar
    else
      "default-profile-photo.png"
    end
  end

  def cover_photo
    cover_photos = user_attachments.where(attachment_type: "cover_photo")
    if cover_photos.last.present?
      cover_photos.last.avatar
    else
      "default-cover-photo.png"
    end

  end

  def has_location?
    city || state || country
  end

  def joined_at
    created_at.strftime("%m/%d/%Y")
  end

  def name
    first_name.present? ? "#{first_name} #{last_name}" : username
  end

  def mailerbox_email(object)
    email
  end

end
