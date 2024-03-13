# frozen_string_literal: true

class ResourcesFormatter
  def format_resources_for_idle_game(idle_game)
    idle_game.idle_game_resources.each_with_object({}) do |idle_game_resource, hash|
      hash[idle_game_resource.resource.key] = {
        name: idle_game_resource.resource.name,
        amount: idle_game_resource.quantity,
        rate: idle_game_resource.rate,
        storage: idle_game_resource.storage,
        icon_url: idle_game_resource.resource.icon_url
      }
    end
  end
end
