Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :edit, :update, :show]
  resources :products, only: [:index]
  root 'users#index'
end
