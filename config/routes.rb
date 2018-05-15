Rails.application.routes.draw do
  devise_for :users
  root to: 'quotes#index'
  resources :quotes
end
