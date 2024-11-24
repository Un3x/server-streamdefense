# frozen_string_literal: true

class Exponential < StructureFormula
  store_accessor :arguments, :base, :multiplier, :default

  validates :base, presence: true, numericality: { only_integer: true }
  validates :multiplier, presence: true, numericality: { only_float: true }
  validates :default, presence: true, numericality: { only_integer: true }

  def evaluate(level)
    ((base**level) * multiplier) + default
  end

  def to_math
    "((#{base}^level) * #{multiplier}) + #{default}"
  end
end
