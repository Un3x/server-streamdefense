# frozen_string_literal: true

class ResourcesFormatter
  def format_resources_for_idle_game(idle_game)
    IdleGameResource.for_idle_game(idle_game).order(:id).each_with_object({}) do |idle_game_resource, hash|
      hash[idle_game_resource.resource.key] = {
        amount: idle_game_resource.quantity,
        rate: idle_game_resource.rate,
        storage: idle_game_resource.storage
      }
    end
  end
end
