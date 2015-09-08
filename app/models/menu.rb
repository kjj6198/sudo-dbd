require "slack_outhook"
class Menu < ActiveRecord::Base
  delegate :url_helpers, to: 'Rails.application.routes' 
  include SlackOutHook
  
  scope :unexpired, -> { where("end_time >= ?", DateTime.now)}
  scope :expired, -> { where("end_time <= ?", DateTime.now)}
  has_many :orders ,dependent: :destroy
  belongs_to :user
  belongs_to :restaurant
  after_create :created_slack_notification
  # after_save :countdown_check
  
  def residual_time_hash
    total_secs = (self.end_time - DateTime.now)
    {
      minutes: (total_secs/60).to_i,
      seconds: (total_secs%60).to_i
    }
  end

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
  
  private 
  
  def created_slack_notification
    @msg = "有新的DBD開始囉！\n
            ```
            訂單編號: #{self.id}
            餐廳: #{self.restaurant.name}
            開始時間: #{self.start_time.strftime('%I:%M %p')}
            結束時間: #{self.end_time.strftime('%I:%M %p')}
            
            訂餐連結: #{ENV['HOME_URL']}#{url_helpers.menu_path(self)}
            剩餘時間: #{self.remain_time}
            ```".split(/\n/).map {|line| line.gsub(/^\s+| \s$/, '')}.join("\n")
    send_msg_to_slack @msg  
    send_msg_to_slack "菜單: #{self.restaurant.filepicker_url}"
  end

  

  

end
