class FrontendController < ApplicationController
  def index
  	@menus = Menu.includes(:restaurant, :user).order(start_time: :desc).all
  end

  def order_info
  	
  end
end
