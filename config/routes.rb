Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  devise_for :users
  root 'products#index'
  resources :users, only: [:index, :edit, :update, :show, :destroy]
  resources :categories, only: [:index, :show]
  post  'categories', to: 'products#select_category_index'
  resources :products do
    collection do
      get 'buy', to: 'products#buy'
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
    collection do
      get 'index', to: 'purchase#index'
      # post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
    member do
      post 'pay', to: 'purchase#pay'
    end
  end
end