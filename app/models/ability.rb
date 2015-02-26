class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, Community if user.title == "admin" || user.title == "expert"

    can :manage, User do |u|
      u.id == user.id || user.title == "admin"
    end
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
