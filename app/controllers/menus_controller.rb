class MenusController < ApplicationController

  def index
    	
  end

  def show
  	@menu = Menu.find(params[:id])
  end

  def new
  	@menu = Menu.new
  	
  end

  def create
  	@menu = Menu.new(params.require(:menu).permit(:name, :start_time, :end_time))
  	@menu.save

  	redirect_to root_path
  end


end
