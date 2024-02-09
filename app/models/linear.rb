# frozen_string_literal: true

class Linear < StructureFormula
  def perform(level)
    (slope * level) + intercept
  end
end
