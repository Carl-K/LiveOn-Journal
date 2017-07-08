# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170616174045) do

  create_table "journal_entries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "user_identification_username", null: false
    t.datetime "entry_created_at", null: false
    t.text "entry"
    t.index ["user_identification_username"], name: "index_journal_entries_on_user_identification_username"
  end

  create_table "user_identifications", primary_key: "username", id: :string, limit: 40, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_user_identifications_on_username"
  end

  add_foreign_key "journal_entries", "user_identifications", column: "user_identification_username", primary_key: "username", name: "FK_user_identification_username"
end
