# frozen_string_literal: true

Rails.application.routes.draw do
  get 'idle/game-state', to: 'idle#game_state', as: 'idle_game_state'

  namespace :admin do
    resources :structure_formulas
    resources :structure_requirements
    resources :idle_game_structures
    resources :structures
    resources :idle_game_resources
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
