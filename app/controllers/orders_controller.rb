class OrdersController < ApplicationController
 before_action :find_menu
 def create
   
   @order = @menu.orders.new(order_params)
   @order.user_id = current_user.id
   if @order.save!
       redirect_to menu_path(@menu), :notice => '成功新增訂餐！請記得繳費'
   else
       redirect_to menu_path(@menu), :notice => '訂餐失敗 哭哭喔'
   end
   
 end

 def destroy
     @order = Order.find(params[:id])
     @order.destroy
     redirect_to @menu
 end

 private 
 
 def order_params
     params[:order].permit(:user_id, :name,:food_name,:price, :has_paid, :note)
 end

 def find_menu
     @menu = Menu.find(params[:menu_id])
 end

end
