Rails.application.routes.draw do
  root 'frontend#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :restaurants
  
  resources :menus do
  	resources :orders do
        member do
            patch :close
        end

    end
    member do
        get :bill
    end
  end  

end
