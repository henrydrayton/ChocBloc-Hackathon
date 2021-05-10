Rails.application.routes.draw do
  
  root "listings#index"

  get "/listings", to: "listings#index"
  get "/listings/:id", to: "listings#show"

end
