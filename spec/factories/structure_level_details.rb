# frozen_string_literal: true

FactoryBot.define do
  factory :structure_level_detail, class: 'StructureLevelDetail' do
    structure { association(:structure) }
    level { 1 }
    description { 'MyString' }
  end
end
