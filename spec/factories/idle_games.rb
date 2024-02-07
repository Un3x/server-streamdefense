# frozen_string_literal: true

FactoryBot.define do
  factory :admin_idle_game, class: 'Admin::IdleGame' do
    channel { nil }
    user { nil }
  end
end
