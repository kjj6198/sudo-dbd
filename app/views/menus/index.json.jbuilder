json.array! @menus do |menu|
    json.id menu.id
    json.order_url "http://#{request.host}/menus/#{menu.id}"
    json.start_time render_time(menu.start_time)
    json.phone_numb menu.restaurant.phone
    json.end_time render_time(menu.end_time)
    json.username menu.user.username
    json.restaurant_name menu.restaurant.name
    json.remain_time menu.remain_time
    json.menu_url menu.restaurant.filepicker_url
    json.expired menu.expired?
end