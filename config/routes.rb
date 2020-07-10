Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :edit, :update, :show, :destroy]
  resources :products, only: [:index]
  root 'products#index'
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end