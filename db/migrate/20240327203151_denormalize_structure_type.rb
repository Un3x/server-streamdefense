class DenormalizeStructureType < ActiveRecord::Migration[7.1]
  def change
    add_column :idle_game_structures, :structure_type, :string
  end
end
