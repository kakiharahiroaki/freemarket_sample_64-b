Rails.application.routes.draw do

  devise_for :users
  root  'items#index'
  get "/items/show", to: "items#show"
  get  "/buys/index", to: "buys#index"
  resources :items, only: [:index]

end


  