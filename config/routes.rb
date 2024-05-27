Rails.application.routes.draw do
  get 'static_pages/accueil'
  root "static_pages#accueil"
  resources :items
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get '/profile', to: 'users#show'
  resources :carts, only: [:show]
end
