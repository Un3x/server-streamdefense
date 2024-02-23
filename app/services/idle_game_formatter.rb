# frozen_string_literal: true

class IdleGameFormatter
  attr_reader :idle_game, :last_sync

  def initialize(idle_game, last_sync = 0)
    @idle_game = idle_game
    @last_sync = last_sync
  end

  def format_idle_game
    {
      time_since_last_sync: (@idle_game.last_sync - last_sync).floor,
      resources: ResourcesFormatter.new.format_resources_for_idle_game(@idle_game),
      structures: StructuresFormatter.new.format_structures_for_idle_game(@idle_game)
    }
  end
end
