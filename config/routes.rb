Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :users, only: [:index, :edit, :update, :show, :destroy]
  resources :categories, only: [:index, :show]
  post  'categories', to: 'products#select_category_index'

  resources :products do
    member do 
      # member ブロックは特定のデータを対象とするのでURLに:idがはいる。(例：products/:id/buy)
      get 'buy', to: 'products#buy'
      post 'index', to: 'purchase#index'
      get 'done', to: 'purchase#done'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    collection do 
      # collection ブロックは全てのデータを対象とするのでURLに:idがはいらない。(例：products/get_category_children)
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
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