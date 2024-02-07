# frozen_string_literal: true

FactoryBot.define do
  factory :structure, class: 'Structure' do
    name { 'MyString' }
    description { 'MyString' }
  end
end
