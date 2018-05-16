Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'users/index'
      get 'users/show'
    end
  end
  root to: 'quotes#index'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :quotes

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :quotes, only: [:index, :show]
      resources :users, only: [:index, :show]
    end
  end
end
