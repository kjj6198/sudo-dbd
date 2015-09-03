class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :find_restaurant, only: [:show]
  def index
    @restaurants = Restaurant.all  	
  end  

  def new
    @restaurant = Restaurant.new
  end

  def show
    
  end

  def create
  	@restaurant = Restaurant.new(restaurant_params)

  	if(@restaurant.save)
      @restaurant.save
      redirect_to root_path, :notice => '成功新增餐廳'
    else
      redirect_to new_restaurant_path(@restaurant), :notice => '新增失敗，請確認欄位'
    end
  end

  private 

  def restaurant_params
    params.require(:restaurant).permit(:name,:phone, :url)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end




end
