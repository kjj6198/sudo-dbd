class Order < ActiveRecord::Base
  belongs_to :menu
  belongs_to :user
  def has_paid?(order)
    return order.has_paid
  end

end
