Rails.application.routes.draw do
 root  'top#index'
 get "/items/show", to: "items#show"
end
