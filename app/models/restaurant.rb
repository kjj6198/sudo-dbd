class Restaurant < ActiveRecord::Base
  
  has_many :menus
  has_many :comments, dependent: :destroy

  validates :name, :phone, presence: true

  def get_average 
    count = self.comments.count
    sum = 0
    self.comments.each do |comment|
      if comment.rank != nil
	    sum = sum + comment.rank
	  end
    end

    average = sum / count

    return average
  end
end
