class Community < ActiveRecord::Base
  has_many :users, through: :memberships
  has_many :memberships
end
