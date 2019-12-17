Rails.application.routes.draw do
  devise_for :users
  root  'items#index'
  get "/items/show", to: "items#show"
  get  "/buys/index", to: "buys#index"
  get "/sells/index", to: "sells#index"
  get  "/users/show", to: "users#show"
  get "/users/update", to: "users#update"
  get "/cards/index", to: "cards#index"
  get "/users/destroy", to: "users#destroy"
  get "/users/create", to: "users#create"
  

  resources :items, only: [:index]
  resources :signup do
    collection do
      get 'index'
      get 'registration'
      get 'sms_confirmation'
      get 'input_address'
      get 'payment'
      get 'signup_complete'
      get 'login'
    end
  end
end