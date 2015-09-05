class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user.blank?
        cannot :manage, :all
        basic_read_only
    else 
        if user.admin?
            can :manage, :all
        end
        basic_read_only
        can :create, Restaurant
        can :create, Order
        can :destroy, Order do |order|
            (order.user_id == user.id || order.menu.user_id == user.id)
        end
    end
  end
  
  private

  def basic_read_only
    can :read, Restaurant
    can :read, Menu
  end
end
