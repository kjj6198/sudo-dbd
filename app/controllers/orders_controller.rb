class OrdersController < ApplicationController

 def create
   @order = Menu.find(params[:menu_id]).orders.create(order_params)
   @menu = Menu.find(params[:menu_id])
   
   redirect_to menu_path(@menu), :notice => '成功新增訂餐！請記得繳費'
 end

 private 
 def order_params
     params[:order].permit(:name,:food_name,:price, :has_paid, :note)
 end

end
