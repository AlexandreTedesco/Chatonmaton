Rails.application.routes.draw do
  # Routes pour les pages statiques
  get 'static_pages/accueil'
  get 'static_pages/contact'
  root 'static_pages#accueil'

  # Routes pour les articles avec gestion des cart_items
  resources :items do
    resources :cart_items, only: %i[create destroy]
  end

  # Routes pour les utilisateurs avec toutes les actions
  resources :users
  devise_for :users

  # Routes pour les commandes avec création et affichage
  resources :orders, only: [:new, :create, :show]

  # Routes pour les paiements avec Stripe
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  # Routes pour l'administration avec le dashboard
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
  end

  # Route pour afficher le statut de santé de l'application
  get 'up', to: 'rails/health#show', as: :rails_health_check

  # Route pour afficher le profil de l'utilisateur
  get '/profile', to: 'users#show'

  # Route pour afficher le panier de l'utilisateur
  resources :carts, only: [:show]
end
