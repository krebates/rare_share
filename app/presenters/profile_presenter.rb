class ProfilePresenter
  def initialize(user)
    @user = user
  end

  def location
    if user.has_location?
      "#{user.city} #{user.state} #{user.country}"
    else
      blank_state
    end
  end

  def blank_state
    " -- "
  end

  def roles
    Role.all.map { |r| [r.name, r.id] }
  end


  private

  attr_reader :user

end
