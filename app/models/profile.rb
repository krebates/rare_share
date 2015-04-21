class Profile < ActiveRecord::Base
  belongs_to :user

 has_many :user_attachments
end
