Rails.application.routes.draw do
  devise_for :users
  root  'items#index'
  get "/items/show", to: "items#show"
  get  "/buys/index", to: "buys#index"
  get "/sells/index", to: "sells#index"
  get "/cards/index"

  resources :items, only: [:index]

  resources :users do
    collection do
      get 'create'
      get 'destroy'
      get 'show'
      get 'update'
    end
  end
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