class MenusController < ApplicationController
  before_action :auth_google_user!, except: [:index, :show, :bill, :over]
  before_action :find_menu, only: [:show, :bill, :over]
  def index
    @menus = Menu.includes(:user, :restaurant).order(end_time: :asc, start_time: :desc);
  end

  def over
    @menu.update_attribute(:end_time, DateTime.now)
    redirect_to action: :bill
  end

  def show
    if @menu.expired?
      redirect_to action: "bill"
    else 
      @restaurant = @menu.restaurant
    end
  end

  def bill

  end

  def new
  	@menu = current_user.menus.new
  end

  def create
    @menu = current_user.menus.new(menu_param)
  	@menu.start_time = Time.now
    @menu.end_time = Time.now + params[:menu][:duration].to_i  * 60
    @menu.save


  	redirect_to @menu, :notice => "訂餐成功!!"
  end
  
  private
  def find_menu
    @menu = Menu.includes(:restaurant, :orders, :user).find(params[:id])
  end

  def menu_param
    params[:menu].permit(:name,:duration, :restaurant_id)
  end


end
