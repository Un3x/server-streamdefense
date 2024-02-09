# frozen_string_literal: true

class Linear < StructureFormula
  def perform(level)
    (arguments['slope'] * level) + arguments['intercept']
  end
end
