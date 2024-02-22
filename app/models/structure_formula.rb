# frozen_string_literal: true

class StructureFormula < ApplicationRecord
  self.inheritance_column = 'formula'

  belongs_to :structure
  belongs_to :resource, optional: true

  validates :category, presence: true

  scope :for_category, ->(category) { where(category:) }
  scope :for_resource, ->(resource) { where(resource:) }

  def calculate(level)
    raise NotImplementedError
  end
end
