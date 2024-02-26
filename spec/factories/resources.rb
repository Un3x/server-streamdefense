# frozen_string_literal: true

FactoryBot.define do
  sequence(:resource_key) { |n| "resource_#{n}" }

  factory :resource, class: 'Resource' do
    key { generate(:resource_key) }
    name { key.humanize }
  end
end
