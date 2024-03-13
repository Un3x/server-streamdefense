class AddRateAndStorageToIdleGameResource < ActiveRecord::Migration[7.1]
  def change
    add_column :idle_game_resources, :rate, :integer, null: false, default: 0
    add_column :idle_game_resources, :storage, :integer, null: false, default: 0

    IdleGameResource.all.each(&:recalculate)
  end
end
