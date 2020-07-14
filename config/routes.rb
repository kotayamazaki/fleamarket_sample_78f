Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :edit, :update, :show, :destroy]
  resources :products, except: :show
  resources :card, only: [:new, :show] 
  resources :categories, only: [:index, :show]
  root 'products#index'
end