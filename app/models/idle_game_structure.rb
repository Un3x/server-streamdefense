# frozen_string_literal: true

class IdleGameStructure < ApplicationRecord
  belongs_to :structure
  belongs_to :idle_game

  validates :structure, presence: true
  validates :idle_game, presence: true

  scope :for_idle_game, ->(idle_game) { where(idle_game:) }

  def visible
    structure.structure_requirements.each do |requirement|
      return false unless requirement.meets_requirements(self)
    end
    true
  end

  def leveling?
    leveling_at.present?
  end
end
