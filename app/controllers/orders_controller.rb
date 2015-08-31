class OrdersController < ApplicationController

 def create
   @order = Menu.find(params[:menu_id]).orders.create(params[:order].permit(:name,:food_name,:price, :has_paid))
   @menu = Menu.find(params[:menu_id])
   
   redirect_to menu_path(@menu)
 end

end
