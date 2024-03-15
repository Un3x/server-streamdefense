# frozen_string_literal: true

class IdleGameFactory
  attr_reader :user, :channel, :idle_game, :season

  def initialize(user, channel)
    @user = user
    @channel = channel
    @season = Season.find_by(active: true)
  end

  def perform
    @idle_game = IdleGame.create!(user:, channel:, last_sync: Time.now, season:)
    create_idle_game_resources
    create_idle_game_structures
    IdleGameRecalculator.new(idle_game).recalculate

    @idle_game
  end

  def create_idle_game_resources
    Resource.where(season:).find_each do |resource|
      IdleGameResource.create!(idle_game:, resource:, quantity: 0)
    end
  end

  def create_idle_game_structures
    Structure.where(season:).find_each do |structure|
      IdleGameStructure.create!(idle_game:, structure:, level: 0)
    end
  end
end
