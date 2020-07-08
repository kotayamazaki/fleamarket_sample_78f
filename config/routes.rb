Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :edit, :update]
  root 'items#index'
end
