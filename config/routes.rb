Rails.application.routes.draw do
  devise_for :users
  root 'frontend#index'

  resources :restaurants
  
  resources :menus do
  	resources :orders
  end  

end
