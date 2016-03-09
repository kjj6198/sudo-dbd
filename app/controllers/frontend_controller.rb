class FrontendController < ApplicationController
  
  def index
  	menus_array = Menu.includes(:restaurant, :user).nice_format
    @menus = Kaminari.paginate_array(menus_array).page(params[:page]).per(5)
  end

  def order_info
  	
  end

  def about
	
  end

  def histroy
    @orders = current_user.orders
  end
end
