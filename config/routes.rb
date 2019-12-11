Rails.application.routes.draw do
  devise_for :users
  root  'items#index'
  get "/items/show", to: "items#show"
  get  "/buys/index", to: "buys#index"
  get  "/users/show", to: "users#show"
  resources :items, only: [:index]

end


  