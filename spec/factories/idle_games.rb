# frozen_string_literal: true

FactoryBot.define do
  factory :idle_game, class: 'IdleGame' do
    channel { association(:channel) }
    user { association(:user) }
    last_sync { Time.now }
    season { association(:season) }
  end
end
