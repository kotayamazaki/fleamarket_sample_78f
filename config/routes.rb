Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :users, only: [:index, :edit, :update, :show, :destroy]
  resources :categories, only: [:index, :show]
  post  'categories', to: 'products#select_category_index'
  resources :products do
    member do
      get 'buy', to: 'products#buy'
      post 'index', to: 'purchase#index'
      get 'done', to: 'purchase#done'
    end
  end
  resources :card, only: [:new, :destroy] do
    collection do
      get 'mypage', to: 'card#mypage'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete' 
    end
  end
  resources :purchase, only: [:index] do
    member do
      get 'index', to: 'purchase#index'
      get 'done', to: 'purchase#done'
      post 'pay', to: 'purchase#pay'
    end
  end
end