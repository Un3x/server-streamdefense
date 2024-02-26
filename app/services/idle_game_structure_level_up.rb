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
  end

  def cancel
    return unless idle_game_structure.leveling_job_id.present?

    cancel_leveling_job
    refund_for_level_down
    idle_game_structure.update!(leveling_job_id: nil, leveling_at: nil)
  end

  def level_up
    IdleSynchronizor.new(idle_game_structure.idle_game).perform
    idle_game_structure.update!(level: idle_game_structure.level + 1, leveling_job_id: nil, leveling_at: nil)
  end

  private

  def cancel_leveling_job
    job = retrieve_active_leveling_job
    job.delete
  end

  def retrieve_active_leveling_job
    SolidQueue::Job.find_by(active_job_id: idle_game_structure.leveling_job_id)
  end

  def calculate_leveling_duration
    idle_game_structure.structure.structure_formulas.for_category('duration').first.calculate(idle_game_structure.level)
  end

  def trigger_leveling_job
    StructureLevelUp.set(wait: calculate_leveling_duration).perform_later idle_game_structure
  end

  def check_resources?
    costs.each do |formula|
      price = formula.calculate(idle_game_structure.level)
      resource = idle_game_structure.idle_game.idle_game_resources.find_by(resource: formula.resource)

      return false if resource.quantity < price
    end

    true
  end

  def pay_for_level_up
    costs.each do |formula|
      price = formula.calculate(idle_game_structure.level)
      resource = idle_game_structure.idle_game.idle_game_resources.find_by(resource: formula.resource)

      resource.update!(quantity: [resource.quantity - price, 0].max)
    end
  end

  def refund_for_level_down
    costs.each do |formula|
      price = formula.calculate(idle_game_structure.level)
      resource = idle_game_structure.idle_game.idle_game_resources.find_by(resource: formula.resource)

      resource.update!(quantity: [resource.quantity + price, resource.storage].min)
    end
  end

  def costs
    idle_game_structure.structure.structure_formulas.for_category('cost')
  end
end
