# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::IdleGamesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/idle_games').to route_to('admin/idle_games#index')
    end

    it 'routes to #show' do
      expect(get: '/admin/idle_games/1').to route_to('admin/idle_games#show', id: '1')
    end
  end
end
