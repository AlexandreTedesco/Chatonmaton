# frozen_string_literal: true

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

  # routes pour stripe

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
  get '/profile', to: 'users#show'
  resources :carts, only: [:show]
end
