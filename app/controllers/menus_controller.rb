class MenusController < ApplicationController
  before_action :authenticate_user!
  def index
    	
  end

  def show
  	@menu = Menu.find(params[:id])
    @restaurant = @menu.restaurant
  end

  def new
  	@menu = Menu.new
  	
  end

  def create
  	@menu = Menu.new(params.require(:menu).permit(:name,:start_time,:end_time,:restaurants_id))
    
  	@menu.save

  	redirect_to root_path
  end
  
  

end
