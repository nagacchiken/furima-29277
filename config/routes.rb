Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items
  resources :items do
    member do
      get 'transactions'
    end
  end
end
