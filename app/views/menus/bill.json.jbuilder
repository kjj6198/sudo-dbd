json.id @menu.id
json.restaurant_name @menu.restaurant.name
json.user do |json|
    json.uid @menu.user.id
    json.name @menu.user.username
end

json.orders do |json|
    json.array! @orders do |order|
        json.ordere_id order.user.id
        json.ordere_name order.user.username
        json.food_name order.food_name
        json.price order.price
        json.note order.note
        json.has_paid order.has_paid
        json.change order.change
    end
end
