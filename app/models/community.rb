class Community < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :discussions
  has_many :supplements

  #include in model to be searchable
  searchkick

   def members
    memberships.map do |membership|
      User.find(membership.user_id)
    end
  end

  def member_names
    members.map do |member|
      member.name
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
