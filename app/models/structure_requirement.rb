# frozen_string_literal: true

class StructureRequirement < ApplicationRecord
  belongs_to :structure
  belongs_to :required_structure, class_name: 'Structure'

  validates :structure, presence: true
  validates :required_structure, presence: true
  validates :required_level, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
