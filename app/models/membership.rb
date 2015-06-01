class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :community

  def self.for(user, community)
    where(user_id: user.id, community_id: community.id).first
  end
end
