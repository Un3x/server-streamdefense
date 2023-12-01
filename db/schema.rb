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

ActiveRecord::Schema[7.1].define(version: 2023_12_01_155547) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channels", force: :cascade do |t|
    t.string "twitch_channel_id"
    t.string "streamer_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "idle_player_resources", force: :cascade do |t|
    t.bigint "idle_players_id", null: false
    t.bigint "resources_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idle_players_id"], name: "index_idle_player_resources_on_idle_players_id"
    t.index ["resources_id"], name: "index_idle_player_resources_on_resources_id"
  end

  create_table "idle_player_structures", force: :cascade do |t|
    t.bigint "structures_id", null: false
    t.bigint "idle_players_id", null: false
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idle_players_id"], name: "index_idle_player_structures_on_idle_players_id"
    t.index ["structures_id"], name: "index_idle_player_structures_on_structures_id"
  end

  create_table "idle_players", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_idle_players_on_channel_id"
    t.index ["user_id"], name: "index_idle_players_on_user_id"
  end

  create_table "requirements", force: :cascade do |t|
    t.bigint "structures_id", null: false
    t.integer "required_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["structures_id"], name: "index_requirements_on_structures_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "structure_formulas", force: :cascade do |t|
    t.bigint "structures_id", null: false
    t.string "type"
    t.string "formula"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["structures_id"], name: "index_structure_formulas_on_structures_id"
  end

  create_table "structures", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.string "twitch_id"
    t.string "nickname"
    t.string "role", default: "USER", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "idle_player_resources", "idle_players", column: "idle_players_id"
  add_foreign_key "idle_player_resources", "resources", column: "resources_id"
  add_foreign_key "idle_player_structures", "idle_players", column: "idle_players_id"
  add_foreign_key "idle_player_structures", "structures", column: "structures_id"
  add_foreign_key "idle_players", "channels"
  add_foreign_key "idle_players", "users"
  add_foreign_key "requirements", "structures", column: "structures_id"
  add_foreign_key "structure_formulas", "structures", column: "structures_id"
end
