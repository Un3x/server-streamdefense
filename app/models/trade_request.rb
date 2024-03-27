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
end
