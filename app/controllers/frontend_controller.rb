class FrontendController < ApplicationController
  def index
  	@menus = Menu.all
  end

  def order_info
  	
  end
end
