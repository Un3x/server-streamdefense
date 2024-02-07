# frozen_string_literal: true

FactoryBot.define do
  factory :admin_idle_game_structure, class: 'Admin::IdleGameStructure' do
    structures { nil }
    idle_games { nil }
    level { 1 }
  end
end
