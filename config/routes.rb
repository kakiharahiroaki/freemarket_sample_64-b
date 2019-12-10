Rails.application.routes.draw do
  devise_for :users
  root  'items#index'
  get  "/buys/index", to: "buys#index"
  resources :items, only: [:index]
end
