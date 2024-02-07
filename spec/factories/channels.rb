# frozen_string_literal: true

FactoryBot.define do
  factory :channel, class: 'Channel' do
    twitch_id { 'MyString' }
  end
end
