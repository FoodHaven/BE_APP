Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      get 'markets/favorites', to: 'markets/favorites#index', as: 'markets_favorites'
      resources :markets, only: [:index, :show] do
        get 'routes', to: 'transit_routes#index'
      end
    end
  end
  resources :users, only: [:new, :create]
end

