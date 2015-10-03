class CommentsController < ApplicationController
  
  before_action :find_restaurant

  def create
    @comment = @restaurant.comments.create(comment_param) 
  	@comment.user_id = current_user.id
    
    @restaurant.rank = @restaurant.get_average
    @restaurant.save!
    
  	if @comment.save
  	  redirect_to @restaurant, :notice => "評論新增成功！"
  	end
  end


  private 

  def comment_param
  	params[:comment].permit(:body,:rank)
  end

  def find_restaurant
  	@restaurant = Restaurant.find(params[:restaurant_id])
  end
end
