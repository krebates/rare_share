class UserAttachment < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :profiles
  belongs_to :users
end
