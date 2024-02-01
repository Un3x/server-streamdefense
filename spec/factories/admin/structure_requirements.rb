# frozen_string_literal: true

FactoryBot.define do
  factory :admin_structure_requirement, class: 'Admin::StructureRequirement' do
    structure { nil }
    required_structure { nil }
    required_level { 1 }
  end
end
