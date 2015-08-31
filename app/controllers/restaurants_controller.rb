class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index
    @restaurants = Restaurant.all  	
  end  

  def new
    @restaurant = Restaurant.new
  end

  def create
  	@restaurant = Restaurant.new(params.require(:restaurant).permit(:name,:phone, :restaurant_picture, :restaurant_picture_cache))
  	@restaurant.save

  	redirect_to root_path
  end





end
