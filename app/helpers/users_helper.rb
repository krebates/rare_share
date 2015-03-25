module UsersHelper
  def recent_users(number_of_users)
    User.all.take(number_of_users)
  end
end
