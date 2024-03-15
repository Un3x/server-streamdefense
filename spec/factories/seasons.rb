# frozen_string_literal: true

FactoryBot.define do
  factory :season, class: 'Season' do
    name { 'MyString' }
    speed { 1 }
    active { false }
  end
end
