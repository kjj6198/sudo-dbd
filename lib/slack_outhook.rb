require 'net/http'
require 'json'

module SlackOutHook
    def send_msg_to_slack msg
        token_url = ENV['SLACK_WEBHOOK_URL']
        json_data = {
            text: msg, 
            username: "dbder"
        }.to_json
        http = Curl.post(token_url, json_data)
        puts http.body_str
    end
end