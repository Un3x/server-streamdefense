# frozen_string_literal: true

FactoryBot.define do
  sequence(:structure_key) { |n| "structure_#{n}" }

  factory :structure, class: 'Structure' do
    key { generate(:structure_key) }
    name { key.humanize }
    description { 'MyString' }
  end
end
