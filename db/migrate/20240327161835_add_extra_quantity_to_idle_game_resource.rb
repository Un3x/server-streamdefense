class AddExtraQuantityToIdleGameResource < ActiveRecord::Migration[7.1]
  def change
    add_column :idle_game_resources, :extra_quantity, :integer, default: 0
  end
end
