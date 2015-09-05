class MenusController < ApplicationController
  before_action :auth_google_user!
  before_action :set_current_user
 
  def index
    	
  end

  def show
  	@menu = Menu.find(params[:id])
    @restaurant = @menu.restaurant


  end

  def new
  	@menu = @user.menus.new
  	
  end

  def create
    @menu = @user.menus.new(menu_param)
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

  def set_current_user
    @user = User.find(current_user)
  end

end
