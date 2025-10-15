Rails.application.routes.draw do
  resources :users
  resources :tweets
  root 'tweets#index'
  
end
