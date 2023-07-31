Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :markets, only: [:index, :show] do
        collection do
          get 'nearby'
        resources :transit_routes, only: [:index, :show], to: 'markets/transit_routes#index'
      end
    end
  end
end