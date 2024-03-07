class CreateAdminStructureLevelDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :structure_level_details do |t|
      t.references :structure, null: false, foreign_key: true
      t.integer :level
      t.string :description

      t.timestamps
    end
  end
end
