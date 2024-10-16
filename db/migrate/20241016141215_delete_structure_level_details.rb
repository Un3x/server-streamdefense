class DeleteStructureLevelDetails < ActiveRecord::Migration[7.2]
  def change
    drop_table :structure_level_details
  end
end
