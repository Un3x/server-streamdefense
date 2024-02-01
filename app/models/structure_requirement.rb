# frozen_string_literal: true

class StructureRequirement < ApplicationRecord
  belongs_to :structure
  belongs_to :required_structure, class_name: 'Structure'
end
