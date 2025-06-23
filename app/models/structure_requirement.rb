# frozen_string_literal: true

class StructureRequirement < ApplicationRecord
  belongs_to :structure
  belongs_to :required_structure, class_name: 'Structure'

  validates :structure, presence: true
  validates :required_structure, presence: true
  validates :required_level, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :restriction, presence: true, inclusion: { in: %w[above below] }

  scope :for_required_structure, ->(required_structure) { where(required_structure:) }
  scope :for_restriction, ->(restriction) { where(restriction:) }
  scope :for_required_level, ->(required_level) { where(required_level:) }

  def meets_requirements?(idle_game_structure)
    required_idle_game_structure = IdleGameStructure.find_by(idle_game: idle_game_structure.idle_game, structure: required_structure)
    if restriction == 'above'
      required_idle_game_structure.level >= required_level
    elsif restriction == 'below'
      required_idle_game_structure.level < required_level && !required_idle_game_structure.leveling?
    end
  end
end
