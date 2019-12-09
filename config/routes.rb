Rails.application.routes.draw do
 root  'top#index'
  resources :users do
    collection do

      get 'create'

    end
  end
end
