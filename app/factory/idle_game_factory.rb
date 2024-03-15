# frozen_string_literal: true

class IdleGameFactory
  attr_reader :user, :channel, :idle_game

  def initialize(user, channel)
    @user = user
    @channel = channel
  end

  def perform
    @idle_game = IdleGame.create!(user:, channel:, last_sync: Time.now)
    create_idle_game_resources
    create_idle_game_structures
    IdleGameRecalculator.new(idle_game).recalculate

    @idle_game
  end

  def create_idle_game_resources
    Resource.all.each do |resource|
      IdleGameResource.create!(idle_game:, resource:, quantity: 0)
    end
  end

  def create_idle_game_structures
    Structure.all.each do |structure|
      IdleGameStructure.create!(idle_game:, structure:, level: 0)
    end
  end
end
