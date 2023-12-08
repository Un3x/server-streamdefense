# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::ChannelsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/channels').to route_to('admin/channels#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/channels/new').to route_to('admin/channels#new')
    end

    it 'routes to #show' do
      expect(get: '/admin/channels/1').to route_to('admin/channels#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/admin/channels/1/edit').to route_to('admin/channels#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/admin/channels').to route_to('admin/channels#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/channels/1').to route_to('admin/channels#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/channels/1').to route_to('admin/channels#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/channels/1').to route_to('admin/channels#destroy', id: '1')
    end
  end
end
