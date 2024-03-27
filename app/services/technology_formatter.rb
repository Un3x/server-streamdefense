# frozen_string_literal: true

class TechnologyFormatter
  def perform(idle_game)
    IdleGameStructure.where(idle_game:, structure_type: 'Technology').each_with_object({}) do |technology, hash|
      hash[technology.key] = send(technology.key, idle_game) if technology.level == 1
    end
  end

  private

  def market(idle_game)
    {
      active: TradeRequest.find_by(idle_game:, active: true).format
    }
  end
end
