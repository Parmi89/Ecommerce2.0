Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [:index, :edit, :update, :destroy]
  end
  resources :frequentquestions

  devise_for :admins
  devise_for :users
  resources :products, path: '/'
  resources :categories
  
  
end
