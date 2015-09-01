class Order < ActiveRecord::Base
  belongs_to :menu

  def has_paid?(order)
    return order.has_paid
  end

end
