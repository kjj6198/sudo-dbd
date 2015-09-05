class Order < ActiveRecord::Base
  belongs_to :menu
  belongs_to :user
  def has_paid?(order)
    return order.has_paid
  end

  def can_save?
  	if(Time.now <= self.menu.end_time)
  	  return true
  	else
	    return false
  	end
  end

end
