class Menu < ActiveRecord::Base
  scope :unexpired, -> { where("end_time <= ?", DateTime.now)}
  has_many :orders ,dependent: :destroy
  belongs_to :user
  belongs_to :restaurant
  
  def remain_time
      mins = (self.end_time - DateTime.now).to_i/60
      secs = (self.end_time - DateTime.now).to_i % 60
      "#{mins}分 #{secs}秒"
  end
end
