# frozen_string_literal: true

class IdleGameStructureLevelUp
  attr_reader :idle_game_structure

  def initialize(idle_game_structure)
    @idle_game_structure = idle_game_structure
  end

  def prepare_level_up
    return unless idle_game_structure.leveling_job_id.nil?
    return unless check_resources?

    pay_for_level_up

    job = trigger_leveling_job

    idle_game_structure.update!(leveling_job_id: job.job_id, leveling_at: Time.now + calculate_leveling_duration)

    IdleGameRecalculator.new(idle_game_structure.idle_game).recalculate_visibility
  end

  def cancel
    return unless idle_game_structure.leveling_job_id.present?

    cancel_leveling_job(idle_game_structure)
    refund_for_level(idle_game_structure.level)
    idle_game_structure.update!(leveling_job_id: nil, leveling_at: nil)

    IdleGameRecalculator.new(idle_game_structure.idle_game).recalculate_visibility
  end

  def level_up
    IdleSynchronizor.new(idle_game_structure.idle_game).perform
    idle_game_structure.update!(level: idle_game_structure.level + 1, leveling_job_id: nil, leveling_at: nil)

    IdleGameRecalculator.new(idle_game_structure.idle_game).recalculate
  end

  # rubocop:disable Metrics/AbcSize
  def level_down
    return unless idle_game_structure.level >= 1

    IdleSynchronizor.new(idle_game_structure.idle_game).perform
    refund_for_level(idle_game_structure.level - 1)

    idle_game_structure.update!(level: idle_game_structure.level - 1, leveling_job_id: nil, leveling_at: nil)
    IdleGameRecalculator.new(idle_game_structure.idle_game).recalculate
  end
  # rubocop:enable Metrics/AbcSize

  private

  def cancel_leveling_job(leveling_structure)
    job = retrieve_active_leveling_job(leveling_structure)
    job.delete
  end

  def retrieve_active_leveling_job(leveling_structure)
    SolidQueue::Job.find_by(active_job_id: leveling_structure.leveling_job_id)
  end

  def calculate_leveling_duration
    idle_game_structure.structure.structure_formulas.for_category('duration').first.calculate(idle_game_structure.level)
  end

  def trigger_leveling_job
    StructureLevelUp.set(wait: calculate_leveling_duration - 2).perform_later idle_game_structure
  end

  def check_resources?
    costs.each do |formula|
      price = formula.calculate(idle_game_structure.level)
      resource = idle_game_structure.idle_game.idle_game_resources.find_by(resource: formula.resource)

      return false if resource.quantity + resource.extra_quantity < price
    end

    true
  end

  def pay_for_level_up
    costs.each do |formula|
      price = formula.calculate(idle_game_structure.level)
      resource = idle_game_structure.idle_game.idle_game_resources.find_by(resource: formula.resource)

      pay_for_resource(resource, price)
    end
  end

  def pay_for_resource(resource, price)
    if resource.extra_quantity.positive?
      remaining_quantity = resource.extra_quantity - price
      resource.extra_quantity = [remaining_quantity, 0].max
      resource.quantity += remaining_quantity if remaining_quantity.negative?
    end

    resource.save!
  end

  def refund_for_level(level)
    costs.each do |formula|
      price = formula.calculate(level)
      resource = idle_game_structure.idle_game.idle_game_resources.find_by(resource: formula.resource)

      resource.update!(quantity: [resource.quantity + price, resource.storage].min)
    end
  end

  def costs
    idle_game_structure.structure.structure_formulas.for_category('cost')
  end
end
