class AddRestrictionToStructureRequirements < ActiveRecord::Migration[7.1]
  def change
    add_column :structure_requirements, :restriction, :string, null: false, default: 'above'
  end
end
