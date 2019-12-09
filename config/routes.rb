Rails.application.routes.draw do
 root  'top#index'
  resources :items do
    collection do
      get 'show'
    end
  end
end
