class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :discussion

  attr_reader :discussion_id
end
