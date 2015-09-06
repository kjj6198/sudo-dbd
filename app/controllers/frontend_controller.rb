class FrontendController < ApplicationController
  
  def index
  	@menus = Menu.includes(:restaurant, :user).nice_format
  end

  def order_info
  	
  end
end
