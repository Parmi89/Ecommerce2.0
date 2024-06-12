Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [:index, :edit, :update, :destroy]
  end
  resources :frequentquestions
  resources :categories
  
  devise_for :admins
  devise_for :users
  resources :products, path: '/'
 
  
end
