Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root  'users#update'

  get "/items/show", to: "items#show"
  get  "/buys/index", to: "buys#index"
  get "/sells/index", to: "sells#index"
  get "/cards/index", to: "cards#index"
  get  "/users/show", to: "users#show"
 
  resources :items, only: [:index]
  resources :users, only: [:create, :destroy, :show, :update] do
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