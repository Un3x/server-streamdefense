# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::SeasonsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/seasons').to route_to('admin/seasons#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/seasons/new').to route_to('admin/seasons#new')
    end

    it 'routes to #show' do
      expect(get: '/admin/seasons/1').to route_to('admin/seasons#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/admin/seasons/1/edit').to route_to('admin/seasons#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/admin/seasons').to route_to('admin/seasons#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/seasons/1').to route_to('admin/seasons#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/seasons/1').to route_to('admin/seasons#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/seasons/1').to route_to('admin/seasons#destroy', id: '1')
    end
  end
end
