# frozen_string_literal: true

FactoryBot.define do
  factory :idle_game, class: 'IdleGame' do
    channel { build(:channel) }
    user { build(:user) }
  end
end
