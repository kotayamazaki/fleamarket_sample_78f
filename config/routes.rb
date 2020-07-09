Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :edit, :update, :show, :destroy]
  resources :products, only: [:index]
  root 'devise/sessions#destroy'
end
