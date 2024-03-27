# frozen_string_literal: true

class TradeRequest < ApplicationRecord
  belongs_to :idle_game
  belongs_to :resource

  def format
    {
      id:,
      user: idle_game.user.nickname,
      resource: resource.key,
      quantity:
    }
  end

  def fullfill
    update!(active: false)
    idle_game_resource = idle_game.idle_game_resources.find_by(resource:)
    idle_game_resource.update!(extra_quantity: idle_game_resource.extra_quantity + quantity)
  end
end
