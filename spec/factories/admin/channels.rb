# frozen_string_literal: true

FactoryBot.define do
  factory :admin_channel, class: 'Admin::Channel' do
    twitch_id { 'MyString' }
  end
end
