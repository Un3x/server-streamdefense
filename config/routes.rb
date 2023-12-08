# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :resources
    resources :idle_games
    resources :channels
    resources :users
    get '/', to: 'home#index', as: :root
  end

  devise_for :users

  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'home#index'
end
