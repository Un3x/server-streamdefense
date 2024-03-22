class AddTypeToStructure < ActiveRecord::Migration[7.1]
  def change
    add_column :structures, :type, :string, default: 'Building'
  end
end
