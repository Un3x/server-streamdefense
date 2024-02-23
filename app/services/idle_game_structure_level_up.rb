# frozen_string_literal: true

class IdleGameStructureLevelUp
  attr_reader :idle_game_structure

  def initialize(idle_game_structure)
    @idle_game_structure = idle_game_structure
  end

  def prepare_level_up
    return unless check_resources?

    pay_for_level_up
    level_up
  end

  def cancel
    refund_for_level_down
    idle_game_structure.update!(level: idle_game_structure.level - 1)
  end

  def level_up
    idle_game_structure.update!(level: idle_game_structure.level + 1)
  end

  private

  def check_resources?
    costs.each do |formula|
      price = formula.calculate(idle_game_structure.level)
      resource = idle_game_structure.idle_game.idle_game_resources.find_by(resource: formula.resource)

      return false if resource.quantity < price
    end

    true
  end

  def pay_for_level_up
    costs.each do |formula|
      price = formula.calculate(idle_game_structure.level)
      resource = idle_game_structure.idle_game.idle_game_resources.find_by(resource: formula.resource)

      resource.update!(quantity: [resource.quantity - price, 0].max)
    end
  end

  def refund_for_level_down
    costs.each do |formula|
      price = formula.calculate(idle_game_structure.level)
      resource = idle_game_structure.idle_game.idle_game_resources.find_by(resource: formula.resource)

      resource.update!(quantity: [resource.quantity + price, resource.storage].min)
    end
  end

  def costs
    idle_game_structure.structure.structure_formulas.for_category('cost')
  end
end
