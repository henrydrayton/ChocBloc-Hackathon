Rails.application.routes.draw do
  devise_for :users
  get '/users/:id', to: 'users#profile'
  
  root to: 'listings#index'
  resources :listings
end