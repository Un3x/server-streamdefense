# frozen_string_literal: true

class Linear < StructureFormula
  store_accessor :arguments, :slope, :intercept

  validates :slope, presence: true, numericality: { only_integer: true }
  validates :intercept, presence: true, numericality: { only_integer: true }

  def calculate(level)
    (slope * level) + intercept
  end
end
