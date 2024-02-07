# frozen_string_literal: true

FactoryBot.define do
  factory :admin_resource, class: 'Admin::Resource' do
    name { 'MyString' }
  end
end
