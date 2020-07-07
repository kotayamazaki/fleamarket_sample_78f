Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :edit, :update]
  resources :products, only: [:index]
  root 'products#index'
end
