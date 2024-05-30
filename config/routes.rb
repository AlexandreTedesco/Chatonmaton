Rails.application.routes.draw do
  get 'static_pages/accueil'
  get 'static_pages/contact'
  root 'static_pages#accueil'

  resources :items do
    resources :cart_items, only: %i[create destroy]
  end

  devise_for :users
  resources :users, only: [:show, :new, :create, :edit, :update]
  resources :orders, only: [:new, :create]

  # Routes pour Stripe
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  # Définition des routes d'application selon le DSL de Rails

  # Afficher le statut de santé sur /up qui retourne 200 si l'application démarre sans exceptions, sinon 500.
  # Peut être utilisé par les équilibreurs de charge et les moniteurs d'activité pour vérifier que l'application est en ligne.
  get 'up' => 'rails/health#show', as: :rails_health_check
  get '/profile', to: 'users#show'
  resources :carts, only: [:show]
end
