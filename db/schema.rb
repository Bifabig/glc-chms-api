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

ActiveRecord::Schema[7.0].define(version: 2023_10_24_141954) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.string "att_taker"
    t.boolean "is_present"
    t.bigint "user_id", null: false
    t.bigint "church_id", null: false
    t.bigint "member_id", null: false
    t.bigint "program_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["church_id"], name: "index_attendances_on_church_id"
    t.index ["member_id"], name: "index_attendances_on_member_id"
    t.index ["program_id"], name: "index_attendances_on_program_id"
    t.index ["team_id"], name: "index_attendances_on_team_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "churches", force: :cascade do |t|
    t.string "name"
    t.date "established_at"
    t.string "location"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_churches_on_user_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.date "joined_at"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "church_id", null: false
    t.bigint "program_id", null: false
    t.bigint "team_id", null: false
    t.index ["church_id"], name: "index_members_on_church_id"
    t.index ["program_id"], name: "index_members_on_program_id"
    t.index ["team_id"], name: "index_members_on_team_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.bigint "user_id", null: false
    t.bigint "church_id", null: false
    t.bigint "member_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["church_id"], name: "index_programs_on_church_id"
    t.index ["member_id"], name: "index_programs_on_member_id"
    t.index ["team_id"], name: "index_programs_on_team_id"
    t.index ["user_id"], name: "index_programs_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "main_leader_name"
    t.string "sub_leader_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "church_id", null: false
    t.bigint "program_id", null: false
    t.index ["church_id"], name: "index_teams_on_church_id"
    t.index ["program_id"], name: "index_teams_on_program_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attendances", "churches"
  add_foreign_key "attendances", "members"
  add_foreign_key "attendances", "programs"
  add_foreign_key "attendances", "teams"
  add_foreign_key "attendances", "users"
  add_foreign_key "churches", "users"
  add_foreign_key "members", "churches"
  add_foreign_key "members", "programs"
  add_foreign_key "members", "teams"
  add_foreign_key "members", "users"
  add_foreign_key "programs", "churches"
  add_foreign_key "programs", "members"
  add_foreign_key "programs", "teams"
  add_foreign_key "programs", "users"
  add_foreign_key "teams", "churches"
  add_foreign_key "teams", "programs"
  add_foreign_key "teams", "users"
end
