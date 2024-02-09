# frozen_string_literal: true

class Exponential < StructureFormula
  def perform(level)
    ((arguments['base']**level) * arguments['multiplier']) + arguments['default']
  end
end
