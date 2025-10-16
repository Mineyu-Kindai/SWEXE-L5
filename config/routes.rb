Rails.application.routes.draw do

  get "top/main"
  post "top/login"
  get "top/logout"
  
  resources :users
  resources :tweets
  resources :likes
  resources :profiles
  
  
  root "tweets#index"
  
end
