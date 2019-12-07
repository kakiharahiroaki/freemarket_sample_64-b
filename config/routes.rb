Rails.application.routes.draw do
 root  'top#index'
  resources :users do
    collection do

      get 'destroy'

    end
  end
end