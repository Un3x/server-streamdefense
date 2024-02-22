# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::ChannelsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/channels').to route_to('admin/channels#index')
    end

    it 'routes to #show' do
      expect(get: '/admin/channels/1').to route_to('admin/channels#show', id: '1')
    end
  end
end
