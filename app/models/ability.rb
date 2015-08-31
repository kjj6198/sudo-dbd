class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role?(:admin)
      can :manage
    end
  end
end
