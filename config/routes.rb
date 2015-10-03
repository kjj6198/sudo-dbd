Rails.application.routes.draw do
  root 'frontend#index'
  get '/about', :controller => :frontend, :action => 'about'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :restaurants do
    resources :comments 
  end
  
  resources :menus do
    member do
      patch :over
    end
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
