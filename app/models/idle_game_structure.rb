# frozen_string_literal: true

class IdleGameStructure < ApplicationRecord
  belongs_to :structure
  belongs_to :idle_game

  validates :structure, presence: true
  validates :idle_game, presence: true

  scope :for_idle_game, ->(idle_game) { where(idle_game:) }
end
