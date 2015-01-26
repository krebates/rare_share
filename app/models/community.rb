class Community < ActiveRecord::Base
  searchkick

  has_many :memberships
  has_many :users, through: :memberships
  has_many :discussions

  def members
    memberships.map do |membership|
      User.find(membership.user_id)
    end
  end

end
