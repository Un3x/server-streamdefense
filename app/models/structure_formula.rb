# frozen_string_literal: true

class StructureFormula < ApplicationRecord
  self.inheritance_column = 'formula'

  delegate :season, to: :structure

  belongs_to :structure
  belongs_to :resource, optional: true

  validates :category, presence: true

  scope :for_category, ->(category) { where(category:) }
  scope :for_resource, ->(resource) { where(resource:) }

  def calculate(level)
    result = evaluate(level)

    result *= season.speed if category == 'production'
    result /= season.speed if category == 'duration'

    result.round
  end

  def evaluate(level)
    raise NotImplementedError
  end
end
