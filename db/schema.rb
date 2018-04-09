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

ActiveRecord::Schema.define(version: 20180408080901) do

  create_table "citizens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "phone_number"
    t.string "gender"
    t.string "occupation"
    t.boolean "marital_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "dob"
    t.boolean "admin"
    t.string "password_digest"
    t.text "address"
    t.bigint "lpg_subsidy_id"
    t.index ["lpg_subsidy_id"], name: "index_citizens_on_lpg_subsidy_id"
    t.index ["phone_number"], name: "index_citizens_on_phone_number", unique: true
  end

  create_table "lpg_subsidies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "citizen_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["citizen_id"], name: "index_lpg_subsidies_on_citizen_id"
  end

  add_foreign_key "citizens", "lpg_subsidies"
  add_foreign_key "lpg_subsidies", "citizens"
end
