class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index
    @restaurants = Restaurant.all  	
  end  

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    
  end

  def create
  	@restaurant = Restaurant.new(params.require(:restaurant).permit(:name,:phone, :url))

  	if(@restaurant.save)
      @restaurant.save
      redirect_to root_path, :notice => '成功新增餐廳'
    else
      redirect_to new_restaurant_path(@restaurant), :notice => '新增失敗，請確認欄位'
    end


  	
  end





end
