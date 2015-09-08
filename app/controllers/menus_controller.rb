require "slack_outhook"

class MenusController < ApplicationController
  before_action :auth_google_user!, except: [:index, :show, :bill, :over]
  before_action :find_menu, only: [:show, :bill, :over]
  before_action :find_orders, only: [:show, :bill, :over]
  include SlackOutHook

  def index
    @menus = Menu.includes(:user, :restaurant).order(end_time: :asc, start_time: :desc);
  end

  def over
    @menu.update_attribute(:end_time, DateTime.now)
    # updated_slack_notification(@menu)
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
    if @menu.save!
      set_worker_countdown(@menu, 20)
     redirect_to @menu, :notice => "訂餐成功!!"
    else
      render :new, :notice => "訂餐失敗！"
    end
  end
  
  private

  def updated_slack_notification(menu)
    if menu.expired?
      @msg = "今天訂的`#{menu.restaurant.name}`截止囉！
              沒訂到的哭哭可憐喔 :crydenny:
              記得去看一下帳單上有沒有錯:
              #{ENV['HOME_URL']}#{bill_menu_path(menu)}
             ".split(/\n/).map {|line| line.gsub(/^\s+| \s$/, '')}.join("\n")
      send_msg_to_slack @msg
    end
  end

  def find_menu
    @menu = Menu.includes(:restaurant, :orders, :user).find(params[:id])
  end

  def find_orders
    @orders = @menu.orders.order(:food_name)
  end

  def menu_param
    params[:menu].permit(:name,:duration, :restaurant_id)
  end

  def set_worker_countdown(menu, time)
    DbdWorker.perform_countdown(@menu.id, 20)
  end
end
