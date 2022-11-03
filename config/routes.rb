# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations'
  }
  resources :orders
  resources :line_items
  resources :categories
  resources :products
  resources :carts
  root to: 'home#index'
end
