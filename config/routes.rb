Rails.application.routes.draw do
  devise_for :users
  root  'items#index'
  get "/items/show", to: "items#show"
  get  "/buys/index", to: "buys#index"
  get "/sells/index", to: "sells#index"
  get  "/users/show", to: "users#show"

  resources :items, only: [:index]
  resources :signup, only: [:index, :create] do
    collection do
      get 'new_member'
      get 'registration'
      get 'sms_confirmation'
      get 'input_address'
      # get 'payment'
      get 'signup_complete'

    end
  end
end