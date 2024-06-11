Rails.application.routes.draw do
  
  namespace :admin do
    resources :users, only: [:index, :edit, :update, :destroy]
  end
  devise_for :admins
  devise_for :users
  resources :categories
  resources :products, path: '/'
  
end
