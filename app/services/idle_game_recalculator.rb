# frozen_string_literal: true

class IdleGameRecalculator
  attr_reader :idle_game

  def initialize(idle_game)
    @idle_game = idle_game
  end

  def recalculate
    idle_game.idle_game_structures.reload.each(&:recalculate)
    idle_game.idle_game_resources.reload.each(&:recalculate)
  end

  def recalculate_visibility
    idle_game.idle_game_structures.each do |idle_game_structure|
      idle_game_structure.update!(visible: idle_game_structure.recalculate_visibility?)
    end
  end
end
