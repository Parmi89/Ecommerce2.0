Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :users
  resources :categories
  resources :products, path: '/'
  
end
