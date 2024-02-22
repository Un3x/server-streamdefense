# frozen_string_literal: true

class ResourcesFormatter
  def format_resources_for_idle_game(idle_game)
    IdleGameResource.for_idle_game(idle_game).each_with_object({}) do |idle_game_resource, hash|
      hash[idle_game_resource.resource.name] = {
        amount: idle_game_resource.quantity
      }
    end
  end
end
