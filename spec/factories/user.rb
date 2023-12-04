# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'juste@unex.com' }
    password { 'password' }
    role { 'USER' }
  end
end
