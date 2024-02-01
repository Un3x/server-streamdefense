# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::StructureRequirementsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/structure_requirements').to route_to('admin/structure_requirements#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/structure_requirements/new').to route_to('admin/structure_requirements#new')
    end

    it 'routes to #show' do
      expect(get: '/admin/structure_requirements/1').to route_to('admin/structure_requirements#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/admin/structure_requirements/1/edit').to route_to('admin/structure_requirements#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/admin/structure_requirements').to route_to('admin/structure_requirements#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/structure_requirements/1').to route_to('admin/structure_requirements#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/structure_requirements/1').to route_to('admin/structure_requirements#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/structure_requirements/1').to route_to('admin/structure_requirements#destroy', id: '1')
    end
  end
end
