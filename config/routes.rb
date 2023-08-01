Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :markets, only: [:index, :show] do
        resources :transit_routes, only: [:index], to: 'markets/transit_routes#index'
      end
      get "/route_details", to: "markets/transit_routes#show"
      get "/favorites", to: "markets/favorites#index"
    end
  end
end