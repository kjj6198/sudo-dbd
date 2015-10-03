class RestaurantsController < ApplicationController
  before_action :auth_google_user!, only: [:new, :create]
  authorize_resource :restaurant
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all.order(rank: :desc)  	
    respond_to do |format|
      format.html
      format.json {render json: @restaurants}
    end
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

  def edit
    
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to @restaurant
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private 

  def restaurant_params
    params.require(:restaurant).permit(:name,:phone, :filepicker_url)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end




end
