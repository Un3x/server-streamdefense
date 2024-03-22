class CreateAdminTradeRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :trade_requests do |t|
      t.references :idle_game, null: false, foreign_key: true
      t.references :resource, null: false, foreign_key: true
      t.integer :quantity
      t.boolean :active

      t.timestamps
    end
  end
end
