# frozen_string_literal: true

class ResourcesFormatter
  def format_resources_for_idle_game(idle_game)
    idle_game.idle_game_resources.order(:id).each_with_object({}) do |idle_game_resource, hash|
      hash[idle_game_resource.key] = idle_game_resource.format
    end
  end
end
