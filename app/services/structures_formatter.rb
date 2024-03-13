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
      leveling_in: idle_game_structure.leveling_in,
      levelUp: idle_game_structure.level_up,
      production: idle_game_structure.production,
      storage: idle_game_structure.storage
    }
  end
end
