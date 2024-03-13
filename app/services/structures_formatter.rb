# frozen_string_literal: true

class StructuresFormatter
  def format_structures_for_idle_game(idle_game)
    idle_game.idle_game_structures.order(:id).each_with_object({}) do |idle_game_structure, hash|
      hash[idle_game_structure.structure.key] = format_structure(idle_game_structure)
    end
  end

  private

  def format_structure(idle_game_structure)
    {
      id: idle_game_structure.id,
      key: idle_game_structure.structure.key,
      name: idle_game_structure.structure.name,
      icon_url: idle_game_structure.structure.icon_url,
      description: idle_game_structure.description,
      image_url: idle_game_structure.image_url,
      level: idle_game_structure.level,
      visible: idle_game_structure.visible,
      leveling_in: leveling_in(idle_game_structure),
      levelUp: format_level_up_for_structure(idle_game_structure),
      production: idle_game_structure.production,
      storage: format_storage_for_structure(idle_game_structure)
    }
  end

  def leveling_in(idle_game_structure)
    idle_game_structure.leveling_at.present? ? (idle_game_structure.leveling_at - Time.now).floor : nil
  end

  def format_requirement_for_structure(structure)
    result = []
    structure.structure_requirements.each do |requirement|
      result << { key: requirement.required_structure.key, level: requirement.required_level }
    end
    result
  end

  def format_level_up_for_structure(idle_game_structure)
    {
      duration: idle_game_structure.structure.structure_formulas.for_category('duration').first&.calculate(idle_game_structure.level),
      costs: format_costs_for_structure(idle_game_structure),
      unlocks: idle_game_structure.next_level_unlocks,
      locks: idle_game_structure.next_level_locks,
      production: format_production_for_structure(idle_game_structure, 1),
      storage: format_storage_for_structure(idle_game_structure, 1)
    }
  end

  def format_costs_for_structure(idle_game_structure, level_adjustment = 0)
    idle_game_structure.structure.structure_formulas.for_category('cost').each_with_object({}) do |formula, hash|
      hash[formula.resource.key] = formula.calculate(idle_game_structure.level + level_adjustment)
    end
  end

  def format_production_for_structure(idle_game_structure, level_adjustment = 0)
    idle_game_structure.structure.structure_formulas.for_category('production').each_with_object({}) do |formula, hash|
      hash[formula.resource.key] = formula.calculate(idle_game_structure.level + level_adjustment)
    end
  end

  def format_storage_for_structure(idle_game_structure, level_adjustment = 0)
    idle_game_structure.structure.structure_formulas.for_category('storage').each_with_object({}) do |formula, hash|
      hash[formula.resource.key] = formula.calculate(idle_game_structure.level + level_adjustment)
    end
  end
end
