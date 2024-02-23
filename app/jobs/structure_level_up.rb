# frozen_string_literal: true

class StructureLevelUp < ApplicationJob
  def perform(idle_game_structure)
    IdleGameStructureLevelUp.new(idle_game_structure).level_up
  end
end
