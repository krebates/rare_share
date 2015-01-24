class Discussion < ActiveRecord::Base
  belongs_to :community
  has_many :posts
end
