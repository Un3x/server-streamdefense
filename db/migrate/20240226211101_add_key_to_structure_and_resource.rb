class AddKeyToStructureAndResource < ActiveRecord::Migration[7.1]
  def change
    add_column :structures, :key, :string, null: false
    add_column :resources, :key, :string, null: false

    add_index :structures, :key, unique: true
    add_index :resources, :key, unique: true
  end
end
