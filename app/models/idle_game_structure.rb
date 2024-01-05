# frozen_string_literal: true

class IdleGameStructure < ApplicationRecord
  belongs_to :structure
  belongs_to :idle_game
end
