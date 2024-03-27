# frozen_string_literal: true

class IdleGameFormatter
  attr_reader :idle_game, :last_sync

  def initialize(idle_game, last_sync = 0)
    @idle_game = idle_game
    @last_sync = last_sync
  end

  def perform
    {
      time_since_last_sync: (@idle_game.last_sync - last_sync).floor,
      technologies: TechnologyFormatter.new.perform(@idle_game),
      resources: ResourcesFormatter.new.perform(@idle_game),
      structures: StructuresFormatter.new.perform(@idle_game)
    }
  end
end
