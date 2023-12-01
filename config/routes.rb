# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
  end

  devise_for :users

  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'home#index'
end
