Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items
  resources :items, only: [:show,:create] do
    member do
      get 'transactions'
      post 'transactions_create'
    end
  end

end
