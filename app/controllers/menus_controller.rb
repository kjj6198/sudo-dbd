class MenusController < ApplicationController
  before_action :auth_google_user!, except: [:index]
 
  def index
    @menus = Menu.includes(:user, :restaurant).order(end_time: :asc, start_time: :desc);
  end

  def show
  	@menu = Menu.find(params[:id])
    @restaurant = @menu.restaurant


  end

  def new
  	@menu = current_user.menus.new
  	
  end

  def create
    @menu = current_user.menus.new(menu_param)
  	@menu.start_time = Time.now
    @menu.end_time = Time.now + params[:menu][:duration].to_i  * 60
    @menu.save

    # todo 訊息統一管理 放在哪？？？
  	redirect_to root_path, :notice => "訂餐成功!!"
  end
  
  private

  def menu_param
    params[:menu].permit(:name,:duration, :restaurant_id)
  end


end
