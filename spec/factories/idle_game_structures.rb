# frozen_string_literal: true

FactoryBot.define do
  factory :idle_game_structure, class: 'IdleGameStructure' do
    structure { build(:structure) }
    idle_game { build(:idle_game) }
    level { 1 }
  end
end
