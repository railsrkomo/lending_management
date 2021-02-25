# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_18_095301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fellows", force: :cascade do |t|
    t.bigint "friend_id", null: false
    t.bigint "user_id", null: false
    t.text "reason_of"
    t.date "relation_since"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["friend_id"], name: "index_fellows_on_friend_id"
    t.index ["user_id"], name: "index_fellows_on_user_id"
  end

  create_table "lending_histories", force: :cascade do |t|
    t.date "lending_at"
    t.date "return_at"
    t.string "lending_name"
    t.bigint "lender_id", null: false
    t.bigint "borrower_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["borrower_id"], name: "index_lending_histories_on_borrower_id"
    t.index ["lender_id"], name: "index_lending_histories_on_lender_id"
  end

  create_table "lendings", force: :cascade do |t|
    t.string "name"
    t.date "lending_at"
    t.date "expected_return_at"
    t.bigint "lender_id", null: false
    t.bigint "borrower_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["borrower_id"], name: "index_lendings_on_borrower_id"
    t.index ["lender_id"], name: "index_lendings_on_lender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
