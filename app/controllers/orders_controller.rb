class OrdersController < ApplicationController
 before_action :find_menu
 before_action :find_order, only: [:destroy, :close, :update]
 authorize_resource :order
 def create
   @order = @menu.orders.new(order_params)
   @order.user_id = current_user.id
   
   if @order.can_save?
       @order.save
       redirect_to menu_path(@menu), :notice => '成功新增訂餐！請記得繳費'
   else
       redirect_to root_path, :notice => '訂餐失敗 哭哭喔 下次要早點訂餐哦' #Denny style
   end
   
 end

 def destroy
     @order.destroy
     redirect_to @menu
 end

 def update
   @order.update_attribute(:change, params[:change].to_i)
   respond_to do |format|
    format.js { render nothing: true } 
  end
 end

 def close
   @order.update_attribute(:change, 0)
   @order.update_attribute(:has_paid, true)
   redirect_to @menu
 end

 private 
 
 def order_params
     params[:order].permit(:user_id, :name,:food_name,:price, :has_paid, :note)
 end

 def find_menu
     @menu = Menu.find(params[:menu_id])
 end

 def find_order
   @order = Order.find(params[:id])
 end

end
