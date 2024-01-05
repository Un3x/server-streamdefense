# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::IdleGameStructuresController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/idle_game_structures').to route_to('admin/idle_game_structures#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/idle_game_structures/new').to route_to('admin/idle_game_structures#new')
    end

    it 'routes to #show' do
      expect(get: '/admin/idle_game_structures/1').to route_to('admin/idle_game_structures#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/admin/idle_game_structures/1/edit').to route_to('admin/idle_game_structures#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/admin/idle_game_structures').to route_to('admin/idle_game_structures#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/idle_game_structures/1').to route_to('admin/idle_game_structures#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/idle_game_structures/1').to route_to('admin/idle_game_structures#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/idle_game_structures/1').to route_to('admin/idle_game_structures#destroy', id: '1')
    end
  end
end
