# frozen_string_literal: true

FactoryBot.define do
  factory :resource, class: 'Resource' do
    name { 'MyString' }
  end
end
