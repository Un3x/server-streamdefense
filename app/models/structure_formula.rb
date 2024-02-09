# frozen_string_literal: true

class StructureFormula < ApplicationRecord
  self.inheritance_column = 'formula'

  belongs_to :structure
  belongs_to :resource, optional: true

  validates :category, presence: true

  def calculate_value(level)
    raise NotImplementedError
  end
end
