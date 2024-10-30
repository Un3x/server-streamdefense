# frozen_string_literal: true

Rails.application.routes.draw do
  get 'idle-game/state', to: 'idle_game#state', as: 'idle_game_state'
  get 'idle-game-structure/level-up', to: 'idle_game_structure#level_up', as: 'idle_game_structure_level_up'
  get 'idle-game-structure/level-down', to: 'idle_game_structure#level_down', as: 'idle_game_structure_level_down'
  get 'idle-game-structure/cancel', to: 'idle_game_structure#cancel', as: 'idle_game_structure_cancel'
  get 'idle-game-trade-request/new', to: 'idle_game_trade_request#new', as: 'idle_game_trade_request_new'
  get 'idle-game-trade-request/list', to: 'idle_game_trade_request#list', as: 'idle_game_trade_request_list'
  get 'idle-game-trade-request/fullfill', to: 'idle_game_trade_request#fullfill', as: 'idle_game_trade_request_fullfill'
  get 'idle-game-trade-request/cancel', to: 'idle_game_trade_request#cancel', as: 'idle_game_trade_request_cancel'

  namespace :admin do
    resources :seasons

    resources :structure_formulas do
      collection do
        post :import
      end
    end

    resources :structure_requirements do
      collection do
        post :import
      end
    end

    resources :idle_game_structures

    resources :structures do
      collection do
        post :import
      end
    end

    resources :idle_game_resources

    resources :resources do
      collection do
        post :import
      end
    end

    resources :idle_games, only: %i[index show destroy] do
      collection do
        delete :destroy_all
      end
    end

    resources :channels, only: %i[index show]

    resources :users, only: %i[index show]

    resources :trade_requests, only: %i[index show]

    get '/', to: 'home#index', as: :root
  end

  devise_for :users

  get 'up' => 'rails/health#show', as: :rails_health_check

  get '/cgu', to: 'home#cgu', as: :cgu

  get '/politique_confidentialite', to: 'home#politique_confidentialite', as: :politique_confidentialite

  root 'home#index'
end
