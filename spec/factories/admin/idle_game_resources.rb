# frozen_string_literal: true

FactoryBot.define do
  factory :admin_idle_game_resource, class: 'Admin::IdleGameResource' do
    idle_game { nil }
    resource { nil }
    quantity { 1 }
  end
end
