# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::IdleGamesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/idle_games').to route_to('admin/idle_games#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/idle_games/new').to route_to('admin/idle_games#new')
    end

    it 'routes to #show' do
      expect(get: '/admin/idle_games/1').to route_to('admin/idle_games#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/admin/idle_games/1/edit').to route_to('admin/idle_games#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/admin/idle_games').to route_to('admin/idle_games#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/idle_games/1').to route_to('admin/idle_games#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/idle_games/1').to route_to('admin/idle_games#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/idle_games/1').to route_to('admin/idle_games#destroy', id: '1')
    end
  end
end
