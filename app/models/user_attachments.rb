class UserAttachments < ActiveRecord::Base

  belongs_to  :user

  has_many    :avatars, inverse_of: :user, dependent: :destroy
  accepts_nested_attributes_for :avatars, allow_destroy: true

end
