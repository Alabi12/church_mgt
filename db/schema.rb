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

ActiveRecord::Schema[7.1].define(version: 2024_05_28_233402) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "churches", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.string "title"
    t.integer "started_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "recipient_id"
    t.integer "sender_id"
  end

  create_table "cs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "generationals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "generationals_members", id: false, force: :cascade do |t|
    t.bigint "generational_id", null: false
    t.bigint "member_id", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.date "date_of_birth"
    t.string "contact_number"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "generational_group"
    t.string "service_group"
    t.string "group"
    t.string "title"
    t.string "member_status"
    t.string "communion_status"
    t.string "nationality"
    t.string "hometown"
    t.string "region"
    t.string "profession"
    t.string "occupation"
    t.string "employer"
    t.string "educational_level"
    t.date "day_born"
    t.string "place_of_birth"
    t.string "home_phone"
    t.string "mobile"
    t.string "work_phone"
    t.string "email_address"
    t.string "postal_address"
    t.string "house_number"
    t.string "location"
    t.date "date_baptised"
    t.string "place_of_baptism"
    t.string "minister_baptism"
    t.string "certificate_number_baptism"
    t.date "date_confirm"
    t.string "place_confirm"
    t.string "minister_confirm"
    t.string "certificate_number_confirm"
    t.string "memory_verse"
    t.date "date_joined"
    t.string "how_become_member"
    t.string "marital_status"
    t.string "certificate_number_marriage"
    t.date "date_of_marriage"
    t.string "type_of_marriage"
    t.string "place_of_marriage"
    t.string "minister_marriage"
    t.string "spouse_name"
    t.string "home_town_spouse"
    t.string "church_spouse"
    t.string "mobile_number_spouse"
    t.string "name_of_school"
    t.string "school_address"
    t.date "admission_date"
    t.date "date_of_completion"
    t.string "course"
    t.string "name"
    t.string "image"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "members_services", id: false, force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "member_id", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount"
    t.bigint "member_id", null: false
    t.string "payment_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_category"
    t.date "date"
    t.index ["member_id"], name: "index_payments_on_member_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "members", "users"
  add_foreign_key "payments", "members"
end
