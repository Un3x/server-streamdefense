# frozen_string_literal: true

class StructuresFormatter
  def format_structures_for_idle_game(idle_game)
    IdleGameStructure.for_idle_game(idle_game).each_with_object({}) do |idle_game_structure, hash|
      hash[idle_game_structure.structure.name] = format_structure(idle_game_structure)
    end
  end

  private

  def format_structure(idle_game_structure)
    {
      name: idle_game_structure.structure.name,
      description: idle_game_structure.structure.description,
      level: idle_game_structure.level,
      visible: false,
      requires: format_requirement_for_structure(idle_game_structure.structure),
      levelUp: format_level_up_for_structure(idle_game_structure),
      production: format_production_for_structure(idle_game_structure),
      storage: format_storage_for_structure(idle_game_structure)
    }
  end

  def format_requirement_for_structure(structure)
    result = []
    structure.structure_requirements.each do |requirement|
      result << { name: requirement.required_structure.name, level: requirement.required_level }
    end
    result
  end

  def format_level_up_for_structure(idle_game_structure)
    {
      duration: idle_game_structure.structure.structure_formulas.for_category('duration').first.perform(idle_game_structure.level),
      costs: format_costs_for_structure(idle_game_structure)
    }
  end

  def format_costs_for_structure(idle_game_structure)
    idle_game_structure.structure.structure_formulas.for_category('cost').each_with_object({}) do |formula, hash|
      hash[formula.resource.name] = formula.perform(idle_game_structure.level)
    end
  end

  def format_production_for_structure(idle_game_structure)
    idle_game_structure.structure.structure_formulas.for_category('production').each_with_object({}) do |formula, hash|
      hash[formula.resource.name] = formula.perform(idle_game_structure.level)
    end
  end

  def format_storage_for_structure(idle_game_structure)
    idle_game_structure.structure.structure_formulas.for_category('storage').each_with_object({}) do |formula, hash|
      hash[formula.resource.name] = formula.perform(idle_game_structure.level)
    end
  end
end
