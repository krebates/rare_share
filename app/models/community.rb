class Community < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :discussions
  has_many :supplements

  validates :name, uniqueness: {scope: :user_id}, presence: true
  validates :description, presence: true

  #include in model to be searchable
  searchkick suggest: ["name"]

  #include in model for pagination
  paginates_per 100

   def members
    memberships.map do |membership|
      User.find(membership.user_id)
    end
  end

  def leaders
    members.select { |member| member.title == 'expert' }
  end

  def member_names
    members.map { |member| member.name }
  end

  def recent_members(number_of_members)
    if members.count < number_of_members
      members
    else
      members.last(number_of_members)
    end
  end
end
