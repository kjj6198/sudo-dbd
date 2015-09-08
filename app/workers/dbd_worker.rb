require "slack_outhook"

class DbdWorker
  include Sidekiq::Worker
  include SlackOutHook
  
  def self.perform_countdown(id, remain_time)
    puts "id is : #{id}" 
    puts "remain time is :::: #{remain_time}"
  end
end