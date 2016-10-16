class Ability
  include CanCan::Ability

  def initialize(user)
    can :crud, User
    can :invite, User
    can :crud, Usergroup, :user_id => user.id
  end
end
