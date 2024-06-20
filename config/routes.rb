Rails.application.routes.draw do
  resources :contacts

  namespace :admin do
    resources :users, only: [:index, :edit, :update, :destroy]
  end
  resources :about_us  
  resources :frequentquestions
  resources :categories
  resources :messages
  devise_for :admins
  devise_for :users
  resources :products, path: '/'
 
  
end
