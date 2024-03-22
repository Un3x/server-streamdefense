# frozen_string_literal: true

class TradeRequest < ApplicationRecord
  belongs_to :idle_game
  belongs_to :resource
end
