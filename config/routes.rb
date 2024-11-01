Rails.application.routes.draw do

  namespace :admin do
    resources :users
  end

  namespace :user do
    resource :info_user, only: [:show, :edit, :update]
  end  

 
  resources :contacts

  resources :about_us  
  resources :frequentquestions
  resources :categories
  resources :messages
  devise_for :admins
  devise_for :users
  resources :products

  root "products#index"
 
  
end
