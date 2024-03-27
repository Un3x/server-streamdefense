# frozen_string_literal: true

class StructuresFormatter
  def perform(idle_game)
    idle_game.idle_game_structures.order(:id).each_with_object({}) do |idle_game_structure, hash|
      hash[idle_game_structure.key] = idle_game_structure.format
    end
  end
end
