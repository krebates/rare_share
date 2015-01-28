class Community < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :discussions
  searchkick

  def members
    memberships.map do |membership|
      User.find(membership.user_id)
    end
  end

  def recent_members(number_of_members)
    if members.count < number_of_members
      members
    else
      members.last(number_of_members)
    end
  end
end
