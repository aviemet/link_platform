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

ActiveRecord::Schema.define(version: 2019_01_09_222138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "link_instance_id", null: false
    t.string "email", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "organization_id"
    t.string "service_id"
    t.string "service_at_location_id"
    t.string "name"
    t.string "title"
    t.string "department"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link_instance_id", null: false
  end

  create_table "eligibilities", force: :cascade do |t|
    t.string "link_instance_id", null: false
    t.string "service_id"
    t.string "eligibility"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "holiday_schedules", force: :cascade do |t|
    t.string "link_instance_id", null: false
    t.string "service_id"
    t.string "location_id"
    t.string "service_at_location_id"
    t.boolean "closed", null: false
    t.time "opens_at"
    t.time "closes_at"
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "link_instance_id", null: false
    t.string "service_id"
    t.string "location_id"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "link_instance_settings", force: :cascade do |t|
    t.string "link_instance_id", null: false
    t.string "name", null: false
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_instance_id", "name"], name: "index_link_instance_settings_on_link_instance_id_and_name", unique: true
  end

  create_table "link_instances", force: :cascade do |t|
    t.string "name", null: false
    t.string "subdomain", null: false
    t.string "email", null: false
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "owner_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "alternate_name"
    t.string "description"
    t.string "transportation"
    t.float "latitude"
    t.float "longitude"
    t.string "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link_instance_id", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.string "alternate_name"
    t.string "description", null: false
    t.string "email"
    t.string "url"
    t.string "tax_status"
    t.string "tax_id"
    t.date "year_incorporated"
    t.string "legal_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link_instance_id", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string "link_instance_id", null: false
    t.string "location_id"
    t.string "service_id"
    t.string "organization_id"
    t.string "contact_id"
    t.string "service_at_location_id"
    t.string "number", null: false
    t.integer "extension"
    t.string "phone_type"
    t.string "language"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "physical_addresses", force: :cascade do |t|
    t.string "location_id"
    t.string "attention"
    t.string "address_1", null: false
    t.string "city", null: false
    t.string "region"
    t.string "state_province", null: false
    t.string "postal_code", null: false
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link_instance_id", null: false
  end

  create_table "postal_addresses", force: :cascade do |t|
    t.string "link_instance_id", null: false
    t.string "location_id"
    t.string "attention"
    t.string "address_1", null: false
    t.string "city", null: false
    t.string "region"
    t.string "state_province", null: false
    t.string "postal_code", null: false
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string "organization_id", null: false
    t.string "name", null: false
    t.string "alternate_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_at_locations", force: :cascade do |t|
    t.string "service_id", null: false
    t.string "location_id", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link_instance_id", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "organization_id", null: false
    t.string "program_id"
    t.string "name", null: false
    t.string "alternate_name"
    t.string "description"
    t.string "url"
    t.string "email"
    t.string "status", null: false
    t.string "interpretation_services"
    t.string "application_services"
    t.string "wait_time"
    t.string "fees"
    t.string "accreditations"
    t.string "licenses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link_instance_id", null: false
  end

end
