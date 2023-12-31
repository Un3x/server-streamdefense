# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::IdleGameResourcesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/idle_game_resources').to route_to('admin/idle_game_resources#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/idle_game_resources/new').to route_to('admin/idle_game_resources#new')
    end

    it 'routes to #show' do
      expect(get: '/admin/idle_game_resources/1').to route_to('admin/idle_game_resources#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/admin/idle_game_resources/1/edit').to route_to('admin/idle_game_resources#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/admin/idle_game_resources').to route_to('admin/idle_game_resources#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/idle_game_resources/1').to route_to('admin/idle_game_resources#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/idle_game_resources/1').to route_to('admin/idle_game_resources#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/idle_game_resources/1').to route_to('admin/idle_game_resources#destroy', id: '1')
    end
  end
end
