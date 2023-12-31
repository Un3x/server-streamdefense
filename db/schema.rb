# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_105_142_255) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'channels', force: :cascade do |t|
    t.string 'twitch_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'idle_game_resources', force: :cascade do |t|
    t.bigint 'idle_game_id', null: false
    t.bigint 'resource_id', null: false
    t.integer 'quantity'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['idle_game_id'], name: 'index_idle_game_resources_on_idle_game_id'
    t.index ['resource_id'], name: 'index_idle_game_resources_on_resource_id'
  end

  create_table 'idle_game_structures', force: :cascade do |t|
    t.bigint 'structure_id', null: false
    t.bigint 'idle_game_id', null: false
    t.integer 'level'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['idle_game_id'], name: 'index_idle_game_structures_on_idle_game_id'
    t.index ['structure_id'], name: 'index_idle_game_structures_on_structure_id'
  end

  create_table 'idle_games', force: :cascade do |t|
    t.bigint 'channel_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['channel_id'], name: 'index_idle_games_on_channel_id'
    t.index ['user_id'], name: 'index_idle_games_on_user_id'
  end

  create_table 'resources', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'structures', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.datetime 'remember_created_at'
    t.string 'twitch_id'
    t.string 'nickname'
    t.string 'role', default: 'USER', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'idle_game_resources', 'idle_games'
  add_foreign_key 'idle_game_resources', 'resources'
  add_foreign_key 'idle_game_structures', 'idle_games'
  add_foreign_key 'idle_game_structures', 'structures'
  add_foreign_key 'idle_games', 'channels'
  add_foreign_key 'idle_games', 'users'
end
