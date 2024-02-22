# frozen_string_literal: true

class AddLastSyncToIdleGame < ActiveRecord::Migration[7.1]
  def change
    add_column :idle_games, :last_sync, :timestamp, default: nil
  end
end
