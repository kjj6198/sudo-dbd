require "slack_outhook"

class DbdWorker
  include Sidekiq::Worker
  include SlackOutHook
  
  def perform(menu_id, cur_end_time, msg)
      menu = Menu.find(menu_id)
      restaurant = menu.restaurant
      if menu.end_time.to_s == cur_end_time
        send_msg_to_slack msg
      end
  end
end