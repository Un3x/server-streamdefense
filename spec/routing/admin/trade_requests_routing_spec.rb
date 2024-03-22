# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::TradeRequestsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/trade_requests').to route_to('admin/trade_requests#index')
    end

    it 'routes to #show' do
      expect(get: '/admin/trade_requests/1').to route_to('admin/trade_requests#show', id: '1')
    end
  end
end
