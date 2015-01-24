class Community < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :discussions
end
