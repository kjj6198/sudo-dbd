class OrdersController < ApplicationController
 before_action :find_menu
 def create
   @order = @menu.orders.create(order_params)
   redirect_to menu_path(@menu), :notice => '成功新增訂餐！請記得繳費'
 end

 def destroy
     @order = Order.find(params[:id])
     @order.destroy
     redirect_to @menu
 end

 private 
 
 def order_params
     params[:order].permit(:name,:food_name,:price, :has_paid, :note)
 end

 def find_menu
     @menu = Menu.find(params[:menu_id])
 end

end
