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

ActiveRecord::Schema.define(version: 2019_07_20_210215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street_1"
    t.string "street_2"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "county"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "addressable_id"
    t.string "addressable_type"
  end

  create_table "companies", force: :cascade do |t|
    t.string "external_id"
    t.string "external_id_type"
    t.string "name"
    t.string "phone_number"
    t.bigint "insurance_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["insurance_id"], name: "index_companies_on_insurance_id"
  end

  create_table "insurances", force: :cascade do |t|
    t.string "member_number"
    t.string "group_number"
    t.string "group_name"
    t.date "effective_date"
    t.date "expiration_date"
    t.string "policy_number"
    t.string "agreement_type"
    t.string "coverage_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "insureds", force: :cascade do |t|
    t.string "identifiers", array: true
    t.string "first_name"
    t.string "last_name"
    t.string "ssn"
    t.string "relationship"
    t.date "date_of_birth"
    t.string "sex"
    t.bigint "insurance_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["insurance_id"], name: "index_insureds_on_insurance_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "external_id"
    t.string "external_id_type"
    t.string "name"
    t.string "type"
    t.bigint "insurance_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["insurance_id"], name: "index_plans_on_insurance_id"
  end

  add_foreign_key "companies", "insurances"
  add_foreign_key "insureds", "insurances"
  add_foreign_key "plans", "insurances"
end
