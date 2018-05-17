Rails.application.routes.draw do
  root to: 'quotes#index'
  devise_for :users

  resources :quotes
  resources :users, only: [:index, :show]

  namespace :api, defaults: { format: :json } do
    namespace :v0 do
      resources :quotes, only: [:index, :show]
      resources :users, only: [:index, :show]
      get '*path', to: 'errors#invalid_path'
    end
  end
end
