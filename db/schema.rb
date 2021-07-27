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

ActiveRecord::Schema.define(version: 2021_07_08_121150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "letters", force: :cascade do |t|
    t.string "name"
    t.string "daytime_phone"
    t.string "nighttime_phone"
    t.string "email_address"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "country"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email_address"], name: "index_letters_on_email_address"
  end

  create_table "polls", force: :cascade do |t|
    t.string "name"
    t.string "display_name"
    t.string "phone"
    t.string "email_address"
    t.string "city"
    t.string "state"
    t.boolean "consent"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "question"
    t.index ["email_address"], name: "index_polls_on_email_address"
  end

end
