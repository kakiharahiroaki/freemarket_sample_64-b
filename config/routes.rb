Rails.application.routes.draw do
 root  'top#index'
  resources :cards do
    collection do

      get 'index'

    end
  end
end
