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

ActiveRecord::Schema[7.0].define(version: 2023_04_04_104153) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "candidates", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "gender"
    t.string "marital_status"
    t.string "nationality"
    t.string "address"
    t.string "notes"
    t.string "present_salary"
    t.string "expected_salary"
    t.string "category"
    t.string "job_level"
    t.string "job_nature"
    t.string "level_of_education"
    t.string "degree"
    t.string "group"
    t.string "institute_name"
    t.string "result"
    t.integer "marks"
    t.integer "year_of_passing"
    t.integer "duration"
    t.string "company_name"
    t.string "company_business"
    t.string "designation"
    t.string "department"
    t.string "responsiblities"
    t.string "company_location"
    t.string "employment_period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.date "date_of_birth"
    t.string "file"
    t.string "status"
    t.integer "user_id"
    t.text "current_location"
    t.string "available_time_zone"
    t.string "industry"
    t.string "start_time"
    t.string "end_time"
    t.string "primary_skill", default: [], array: true
    t.string "secondary_skill", default: [], array: true
    t.string "image"
    t.string "experience"
    t.string "link"
    t.string "language"
    t.string "updated_file"
    t.string "city"
    t.index ["slug"], name: "index_candidates_on_slug", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "candidate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_comments_on_candidate_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "interview_schedules", force: :cascade do |t|
    t.bigint "lead_id", null: false
    t.bigint "candidate_id", null: false
    t.string "url"
    t.string "time"
    t.integer "hr_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id", "lead_id"], name: "index_interview_schedules_on_candidate_id_and_lead_id", unique: true
    t.index ["candidate_id"], name: "index_interview_schedules_on_candidate_id"
    t.index ["lead_id"], name: "index_interview_schedules_on_lead_id"
  end

  create_table "lead_assignments", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.bigint "lead_id", null: false
    t.integer "hr_id"
    t.integer "sales_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_lead_assignments_on_candidate_id"
    t.index ["lead_id"], name: "index_lead_assignments_on_lead_id"
  end

  create_table "leads", force: :cascade do |t|
    t.string "name"
    t.string "profile"
    t.string "assigned_to"
    t.string "status", default: "in-progress"
    t.text "additional_info"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_leads_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "sender_id"
    t.string "sender_type"
    t.integer "reciver_id"
    t.string "reciver_type"
    t.boolean "read", default: false, null: false
    t.bigint "lead_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "candidate_id"
    t.index ["lead_id"], name: "index_notifications_on_lead_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "skill_sets", force: :cascade do |t|
    t.string "name"
    t.string "skill_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "candidates"
  add_foreign_key "comments", "users"
  add_foreign_key "interview_schedules", "candidates"
  add_foreign_key "interview_schedules", "leads"
  add_foreign_key "lead_assignments", "candidates"
  add_foreign_key "lead_assignments", "leads"
  add_foreign_key "leads", "users"
  add_foreign_key "notifications", "leads"
  add_foreign_key "notifications", "users"
end
