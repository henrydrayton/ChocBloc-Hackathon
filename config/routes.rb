Rails.application.routes.draw do
  
  root to: 'pages#home'
  devise_for :users

  # root "listings#index"
  get 'pages/home'
  resources :listings

end
