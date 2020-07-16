Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :edit, :update, :show, :destroy]
  post  'categories', to: 'products#select_category_index'
  resources :categories, only: [:index, :show]
  resources :products
  root 'products#index'
  resources :card, only: [:new, :destroy] do
    collection do
      get 'mypage', to: 'card#mypage'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete' 
    end
  end
end