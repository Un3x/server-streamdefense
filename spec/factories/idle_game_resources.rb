# frozen_string_literal: true

FactoryBot.define do
  factory :idle_game_resource, class: 'IdleGameResource' do
    idle_game { build(:idle_game) }
    resource { build(:resource) }
    quantity { 1 }
  end
end
