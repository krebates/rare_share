class Connection < ActiveRecord::Base
  belongs_to :user
  belongs_to :connect, class_name: "User"
  scope :connections_with_user, ->(user) { where(connect_id: user.id) }

  def pending_connections(user, connection)
    #TODO: refactor, maybe user where...and?
    unless user.connections.map(&:connect_id).include?(connection.user_id)
      connection.user_name
    end
  end

  def user_name
    User.find_by(id: user_id).name
  end

  def connect_name
    User.find_by(id: connect_id).name
  end
end
