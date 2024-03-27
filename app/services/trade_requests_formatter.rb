# frozen_string_literal: true

class TradeRequestsFormatter
  attr_reader :idle_game

  def initialize(idle_game)
    @idle_game = idle_game
  end

  def perform
    {
      active: active_trade_request&.format,
      pending: pending_trade_requests.map(&:format)
    }
  end

  private

  def active_trade_request
    @trade_request = TradeRequest.find_by(idle_game: @idle_game, active: true)
  end

  def pending_trade_requests
    TradeRequest.joins(:idle_game).where(idle_game: { channel: idle_game.channel, season: Season.find_by(active: true) }, active: true).where.not(idle_game:)
  end
end
