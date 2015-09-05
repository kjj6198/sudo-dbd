json.array! @menus do |menu|
    json.start_time render_time(menu.start_time)
    json.phone_numb menu.restaurant.phone
    json.end_time render_time(menu.end_time)
    json.username menu.user.username
    json.restaurant_name menu.restaurant.name
    json.remain_time menu.remain_time
    json.menu_url menu.restaurant.filepicker_url
end