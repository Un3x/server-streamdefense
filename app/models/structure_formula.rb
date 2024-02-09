# frozen_string_literal: true

class StructureFormula < ApplicationRecord
  self.inheritance_column = 'formula'

  store_accessor :arguments, :slope, :intercept, :base, :multiplier, :default
  attribute :slope, :integer
  attribute :intercept, :integer
  attribute :base, :integer
  attribute :multiplier, :integer
  attribute :default, :integer

  belongs_to :structure
  belongs_to :resource, optional: true

  validates :category, presence: true

  def calculate_value(level)
    raise NotImplementedError
  end
end
