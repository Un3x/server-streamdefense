# frozen_string_literal: true

class IdleGameResource < ApplicationRecord
  belongs_to :idle_game
  belongs_to :resource
end
