class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role?(:admin)
      can :all
    end
	else
	  basic_edit_menu
	end
  end
  

  def basic_edit_menu
  	can :manege, Menu do |menu|
  	  menu.user_id == user.id
  	end
  end
end
