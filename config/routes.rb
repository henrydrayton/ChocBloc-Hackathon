Rails.application.routes.draw do
  get "/listings", to: "listings#index"
end
