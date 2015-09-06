class Menu < ActiveRecord::Base
  scope :unexpired, -> { where("end_time >= ?", DateTime.now)}
  scope :expired, -> { where("end_time <= ?", DateTime.now)}
  has_many :orders ,dependent: :destroy
  belongs_to :user
  belongs_to :restaurant

  def remain_time
      mins = (self.end_time - DateTime.now).to_i/60
      secs = (self.end_time - DateTime.now).to_i % 60
      "#{mins}分 #{secs}秒"
  end

  def self.nice_format
    self.unexpired.order(end_time: :asc)+self.expired.order(end_time: :desc)
  end


  def expired?
      self.end_time - DateTime.now <= 0
  end
end
