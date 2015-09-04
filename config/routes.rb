Rails.application.routes.draw do
  root 'frontend#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :restaurants
  
  resources :menus do
  	resources :orders
  end  

end
