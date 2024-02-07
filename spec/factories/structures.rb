# frozen_string_literal: true

FactoryBot.define do
  factory :admin_structure, class: 'Admin::Structure' do
    name { 'MyString' }
    description { 'MyString' }
  end
end
