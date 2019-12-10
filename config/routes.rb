Rails.application.routes.draw do
  root  'items#index'
  get  "/buys/index", to: "buys#index"
  resources :items, only: [:index]
end
