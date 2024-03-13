# frozen_string_literal: true

class IdleSynchronizor
  attr_reader :idle_game, :time_elapsed

  def initialize(idle_game)
    @idle_game = idle_game
  end

  def perform
    update_sync_date
    produce_resources if time_elapsed.present?
  end

  private

  def produce_resources
    idle_game.idle_game_resources.each do |idle_game_resource|
      idle_game_resource.update!(quantity: [idle_game_resource.quantity + (idle_game_resource.rate * time_elapsed), idle_game_resource.storage].min)
    end
  end

  def update_sync_date
    last_sync = idle_game.last_sync
    idle_game.update!(last_sync: Time.now)

    @time_elapsed = (idle_game.last_sync - last_sync).floor if last_sync.present?
  end
end
