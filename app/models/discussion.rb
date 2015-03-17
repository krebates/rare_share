class Discussion < ActiveRecord::Base
  belongs_to :community
  belongs_to :user
  has_many :posts

  def author
    User.find(user_id)
  end

  def last_updated
    if posts.present?
      posts.order('updated_at').last.updated_at
    else
      updated_at  
    end
  end
end
