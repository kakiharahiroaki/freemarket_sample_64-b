Rails.application.routes.draw do
 root  'top#index'
  resources :buys , only: [:index , :show] do
    collection do
      get 'index'
      get 'show'
    end
  end
end
