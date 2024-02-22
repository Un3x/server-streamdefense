# frozen_string_literal: true

class IdleGameResource < ApplicationRecord
  belongs_to :idle_game
  belongs_to :resource

  validates :idle_game, presence: true
  validates :resource, presence: true

  scope :for_idle_game, ->(idle_game) { where(idle_game:) }
end
