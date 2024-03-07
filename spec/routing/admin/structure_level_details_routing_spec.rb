# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::StructureLevelDetailsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/structure_level_details').to route_to('admin/structure_level_details#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/structure_level_details/new').to route_to('admin/structure_level_details#new')
    end

    it 'routes to #show' do
      expect(get: '/admin/structure_level_details/1').to route_to('admin/structure_level_details#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/admin/structure_level_details/1/edit').to route_to('admin/structure_level_details#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/admin/structure_level_details').to route_to('admin/structure_level_details#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/structure_level_details/1').to route_to('admin/structure_level_details#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/structure_level_details/1').to route_to('admin/structure_level_details#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/structure_level_details/1').to route_to('admin/structure_level_details#destroy', id: '1')
    end
  end
end
