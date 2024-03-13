# frozen_string_literal: true

class IdleGameRecalculator
  attr_reader :idle_game

  def initialize(idle_game)
    @idle_game = idle_game
  end

  def recalculate
    idle_game.idle_game_structures.each(&:recalculate)
  end
end
