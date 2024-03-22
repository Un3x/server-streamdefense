# frozen_string_literal: true

FactoryBot.define do
  factory :trade_request, class: 'TradeRequest' do
    idle_game { association(:idle_game) }
    resource { association(:resource) }
    quantity { 100 }
    active { false }
  end
end
