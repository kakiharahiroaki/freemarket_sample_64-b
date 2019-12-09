Rails.application.routes.draw do
  root  'items#index'
  resources :items, only: [:index]
  resources :users do
    collection do

      get 'update'

    end
  end
end
