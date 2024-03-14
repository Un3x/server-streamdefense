# frozen_string_literal: true

class IdleGameResource < ApplicationRecord
  belongs_to :idle_game
  belongs_to :resource

  validates :idle_game, presence: true
  validates :resource, presence: true

  scope :for_idle_game, ->(idle_game) { where(idle_game:) }

  def format
    {
      name:,
      amount: quantity,
      rate:,
      storage:,
      icon_url:
    }
  end

  def recalculate
    update!(
      rate: recalculate_rate,
      storage: recalculate_storage,
      key: resource.key,
      name: resource.name,
      icon_url: resource.icon_url
    )
  end

  def recalculate_rate
    result = 0
    idle_game.idle_game_structures.each do |idle_game_structure|
      next unless idle_game_structure.visible

      formula = idle_game_structure.structure.structure_formulas.for_resource(resource).for_category('production').first
      result += formula.calculate(idle_game_structure.level) if formula.present?
    end
    result
  end

  def recalculate_storage
    result = 0
    idle_game.idle_game_structures.each do |idle_game_structure|
      next unless idle_game_structure.visible

      formula = idle_game_structure.structure.structure_formulas.for_resource(resource).for_category('storage').first
      result += formula.calculate(idle_game_structure.level) if formula.present?
    end
    result
  end
end
