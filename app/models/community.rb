class Community < ActiveRecord::Base
  searchkick

  has_many :users, through: :memberships
  has_many :memberships
end
