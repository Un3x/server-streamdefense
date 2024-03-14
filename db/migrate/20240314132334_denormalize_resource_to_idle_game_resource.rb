class DenormalizeResourceToIdleGameResource < ActiveRecord::Migration[7.1]
  def change
    add_column :idle_game_resources, :key, :string
    add_column :idle_game_resources, :name, :string
    add_column :idle_game_resources, :icon_url, :string

    IdleGameResource.find_each(&:recalculate)
  end
end
