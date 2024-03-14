# frozen_string_literal: true

class IdleGameStructure < ApplicationRecord
  belongs_to :structure
  belongs_to :idle_game

  validates :structure, presence: true
  validates :idle_game, presence: true

  scope :for_idle_game, ->(idle_game) { where(idle_game:) }

  def leveling?
    leveling_at.present?
  end

  def leveling_in
    leveling_at.present? ? (leveling_at - Time.now).floor : nil
  end

  def format
    {
      id:,
      key:,
      name:,
      icon_url:,
      description:,
      image_url:,
      level:,
      visible:,
      leveling_in:,
      level_up:,
      production:,
      storage:
    }
  end

  def recalculate
    update!(
      visible: recalculate_visibility,
      description: recalculate_description,
      image_url: recalculate_image_url,
      production: recalculate_category('production'),
      storage: recalculate_category('storage'),
      level_up: recalculate_level_up,
      key: structure.key,
      name: structure.name,
      icon_url: structure.icon_url
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

  def recalculate_category(category, level_offset = 0)
    structure.structure_formulas.for_category(category).each_with_object({}) do |formula, hash|
      hash[formula.resource.key] = formula.calculate(level + level_offset)
    end
  end

  def recalculate_next_level_unlocks
    StructureRequirement.for_required_structure(structure).for_restriction('above').for_required_level(level + 1).map(&:structure).map(&:key)
  end

  def recalculate_next_level_locks
    StructureRequirement.for_required_structure(structure).for_restriction('below').for_required_level(level + 1).map(&:structure).map(&:key)
  end

  def recalculate_level_up
    {
      duration: structure.structure_formulas.for_category('duration').first&.calculate(level),
      costs: recalculate_category('cost'),
      unlocks: recalculate_next_level_unlocks,
      locks: recalculate_next_level_locks,
      production: recalculate_category('production', 1),
      storage: recalculate_category('storage', 1)
    }
  end
end
