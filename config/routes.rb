Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :edit, :update, :show, :destroy]
  resources :products, only: [:index]
  resources :card, only: [:new, :show] 
  root 'products#index'
end
