class RemoveUniqueKeyOnStructureResource < ActiveRecord::Migration[7.1]
  def change
    remove_index :structures, :key
    remove_index :resources, :key

    add_index :structures, :key
    add_index :resources, :key
  end
end
