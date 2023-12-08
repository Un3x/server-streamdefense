# frozen_string_literal: true

class CreateAdminResources < ActiveRecord::Migration[7.1]
  def change
    create_table :resources do |t|
      t.string :name

      t.timestamps
    end
  end
end
