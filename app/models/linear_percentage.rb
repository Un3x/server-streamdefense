# frozen_string_literal: true

class LinearPercentage < StructureFormula
  store_accessor :arguments, :treshold, :intercept, :slope, :multiplier

  validates :treshold, presence: true, numericality: { only_integer: true }
  validates :intercept, presence: true, numericality: { only_integer: true }
  validates :slope, presence: true, numericality: { only_integer: true }
  validates :multiplier, presence: true, numericality: { only_float: true }

  def calculate(level)
    result = if level <= treshold
               intercept + (slope * level)
             else
               after_treshold(level)
             end

    result.round
  end

  def after_treshold(level)
    result = intercept + (slope * treshold)
    result * ((1 + multiplier)**(level - treshold))
  end
end
