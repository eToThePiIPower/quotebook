Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  root to: 'quotes#index'
  resources :quotes
end
