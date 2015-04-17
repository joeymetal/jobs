# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150415040443) do

  create_table "addresses", force: true do |t|
    t.string   "street"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.string   "cep"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id"

  create_table "applicant_jobs", force: true do |t|
    t.integer  "applicant_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applicant_jobs", ["applicant_id"], name: "index_applicant_jobs_on_applicant_id"
  add_index "applicant_jobs", ["job_id"], name: "index_applicant_jobs_on_job_id"

  create_table "applicants", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "cpf"
    t.string   "rg"
    t.string   "sex"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.date     "birthday"
    t.string   "slug"
  end

  add_index "applicants", ["slug"], name: "index_applicants_on_slug", unique: true
  add_index "applicants", ["user_id"], name: "index_applicants_on_user_id"

  create_table "applicants_jobs", id: false, force: true do |t|
    t.integer "applicant_id", null: false
    t.integer "job_id",       null: false
  end

  create_table "contacts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "trading_name"
    t.string   "fancy_name"
    t.integer  "cnpj"
    t.string   "commercial_activity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.date     "foundation"
    t.string   "slug"
  end

  add_index "customers", ["slug"], name: "index_customers_on_slug", unique: true
  add_index "customers", ["user_id"], name: "index_customers_on_user_id"

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.integer  "vacancies"
    t.decimal  "salary"
    t.date     "expiration"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.string   "slug"
    t.boolean  "featured",    default: false
  end

  add_index "jobs", ["customer_id"], name: "index_jobs_on_customer_id"
  add_index "jobs", ["slug"], name: "index_jobs_on_slug", unique: true

  create_table "phones", force: true do |t|
    t.string   "tel"
    t.string   "cel"
    t.string   "others"
    t.text     "observations"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "phones", ["user_id"], name: "index_phones_on_user_id"

  create_table "profiles", force: true do |t|
    t.text     "skills"
    t.text     "objectives"
    t.text     "formations"
    t.text     "professional_experiences"
    t.text     "qualifications"
    t.text     "additional_informations"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "applicant_id"
  end

  add_index "profiles", ["applicant_id"], name: "index_profiles_on_applicant_id"

  create_table "simple_captcha_data", force: true do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "username"
    t.integer  "roles_mask"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
