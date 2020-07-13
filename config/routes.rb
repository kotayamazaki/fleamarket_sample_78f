Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :edit, :update, :show, :destroy]
  resources :products, only: [:index]
  root 'items#index'
  resources :card, only: [:new, :show, :destroy] do
    collection do
      get 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete' 
    end
    # ↑今後使用することがなくなったときに削除する。(collection doから)
  end
end