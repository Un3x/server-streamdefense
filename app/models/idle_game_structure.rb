# frozen_string_literal: true

class IdleGameStructure < ApplicationRecord
  belongs_to :structure
  belongs_to :idle_game

  validates :structure, presence: true
  validates :idle_game, presence: true

  scope :for_idle_game, ->(idle_game) { where(idle_game:) }

  def next_level_unlocks
    StructureRequirement.for_required_structure(structure).for_restriction('above').for_required_level(level + 1).map(&:structure).map(&:key)
  end

  def next_level_locks
    StructureRequirement.for_required_structure(structure).for_restriction('below').for_required_level(level + 1).map(&:structure).map(&:key)
  end

  def leveling?
    leveling_at.present?
  end

  def recalculate
    update!(
      visible: recalculate_visibility,
      description: recalculate_description,
      image_url: recalculate_image_url
    )
  end

  private

  def recalculate_description
    structure.structure_level_detail(level)&.description.presence || structure.description
  end

  def recalculate_image_url
    structure.structure_level_detail(level)&.image_url
  end

  def recalculate_visibility
    IdleGameConfiguration.instance.structure(structure.key).structure_requirements.each do |requirement|
      return false unless requirement.meets_requirements(self)
    end
    true
  end
end
