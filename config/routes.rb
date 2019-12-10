Rails.application.routes.draw do

  devise_for :users


root  'items#index'
  get  "/buys/index", to: "buys#index"
  resources :items, only: [:index]
 root  'top#index'
 resources :users do
    collection do
      get 'new_menber'
      get 'registration'
      get 'sms_confirmation'
      get 'input_address'
      get 'payment'
      get 'signup_complete'
      get 'login'
    end
  end
end


  