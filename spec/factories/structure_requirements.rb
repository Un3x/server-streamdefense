# frozen_string_literal: true

FactoryBot.define do
  factory :structure_requirement, class: 'StructureRequirement' do
    structure { build(:structure) }
    required_structure { build(:structure) }
    required_level { 1 }
  end
end
