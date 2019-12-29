Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root'items#index'
  get "/items/show", to: "items#show"
  get  "/buys/index", to: "buys#index"
  get "/sells/index", to: "sells#index"
  get "/cards/index", to: "cards#index"
  get "/users/create", to: "users#create"
  get "/users/update", to: "users#update"
  get "/users/destroy", to: "users#destroy"
  get  "/users/show", to: "users#show"
  
  resources :items  do
    member do
     get :stopExhibit
     get :resumeExhibit
   end
  end
  resources :sells, only: :create
  resources :users, only: [:create, :destroy, :show, :update] do
    collection do
      get 'create'
      get 'destroy'
      get 'show'
      get 'update'
      get 'sell_item'
    end
  end
  resources :signup do
    collection do
      get 'new_member'
      get 'registration'
      get 'sms_confirmation'
      get 'input_address'
      get 'signup_complete'
      end
    end
    resources :cards, only: [:new, :create, :show, :destroy] do
      collection do
        post 'create'
        post 'new'
        post 'show'
        get 'confirmation'
      end
    end
    resources :purchase, only: [:index] do
      member do
        get 'index'
        post 'pay'
        get 'done'
      end
    end
  end