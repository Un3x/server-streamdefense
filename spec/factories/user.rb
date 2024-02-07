# frozen_string_literal: true

FactoryBot.define do
  sequence(:email) { |n| "user_#{n}@example.org" }

  factory :user do
    email
    password { 'password' }
    role { 'USER' }
  end
end
