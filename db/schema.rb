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

ActiveRecord::Schema.define(version: 20150913233110) do

  create_table "banners", force: true do |t|
    t.integer  "position"
    t.integer  "category_id"
    t.boolean  "is_deleted",         default: false
    t.boolean  "is_published",       default: true
    t.boolean  "has_link",           default: true
    t.string   "name"
    t.string   "title"
    t.string   "link"
    t.text     "text"
    t.datetime "show_start"
    t.datetime "show_end"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "big_images", force: true do |t|
    t.integer  "position"
    t.boolean  "is_public",            default: true
    t.boolean  "is_deleted",           default: false
    t.integer  "category_id"
    t.string   "title"
    t.string   "params"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "preview_file_name"
    t.string   "preview_content_type"
    t.integer  "preview_file_size"
    t.datetime "preview_updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "categories", force: true do |t|
    t.integer  "position"
    t.boolean  "is_deleted",   default: false
    t.boolean  "is_published", default: true
    t.integer  "type_id"
    t.string   "title"
    t.string   "image"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "homesteads", force: true do |t|
    t.integer  "domain_id"
    t.integer  "sector_id"
    t.integer  "land_use_id",          default: 1
    t.integer  "phase"
    t.string   "site_num"
    t.string   "cadastral_num"
    t.string   "num"
    t.integer  "status_id",            default: 1
    t.datetime "booked_date"
    t.string   "square_meters"
    t.string   "price_for_are"
    t.string   "price_infra"
    t.string   "price"
    t.string   "discount",             default: "0"
    t.integer  "land_link_id"
    t.integer  "distance_to_lake"
    t.boolean  "has_coast",            default: false
    t.boolean  "has_forest",           default: false
    t.boolean  "near_forest",          default: false
    t.boolean  "corner_site",          default: false
    t.boolean  "outside_site",         default: false
    t.boolean  "has_basement",         default: false
    t.boolean  "has_building",         default: false
    t.integer  "shape_id"
    t.integer  "altitude"
    t.string   "slope"
    t.integer  "k_interes",            default: 0
    t.integer  "k_browsing",           default: 0
    t.string   "neighbors"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "coords"
    t.boolean  "show_on_map",          default: true
    t.boolean  "show_but_add_compare", default: true
    t.boolean  "show_but_demonstrate", default: true
    t.boolean  "show_but_auction",     default: false
    t.boolean  "show_but_booking",     default: true
  end

  create_table "messages", force: true do |t|
    t.boolean  "is_actual"
    t.boolean  "is_deleted"
    t.datetime "date"
    t.integer  "category_id"
    t.integer  "homestead_id"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meta_tags", force: true do |t|
    t.text     "title"
    t.text     "description"
    t.text     "keywords"
    t.string   "url"
    t.integer  "metatagable_id",                   null: false
    t.string   "metatagable_type",                 null: false
    t.integer  "skin_id"
    t.boolean  "no_cache",         default: false
    t.boolean  "noindex",          default: false
    t.boolean  "nofollow",         default: false
    t.boolean  "is_redirect",      default: false
    t.string   "redirect_uri"
    t.integer  "hits_count",       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.integer  "parent_id"
    t.integer  "position"
    t.boolean  "is_deleted",           default: false
    t.boolean  "is_published",         default: true
    t.boolean  "is_shown_in_menu",     default: false
    t.boolean  "is_preview_published", default: false
    t.string   "title"
    t.string   "menu_title"
    t.text     "announce"
    t.text     "body"
    t.string   "alias"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "script_after"
    t.string   "script_for_eval"
    t.integer  "skin_id"
  end

  create_table "photos", force: true do |t|
    t.integer  "position"
    t.integer  "category_id"
    t.boolean  "is_deleted",           default: false
    t.boolean  "is_published",         default: true
    t.boolean  "is_shown_in_menu",     default: true
    t.boolean  "is_preview_published", default: true
    t.integer  "skin_id"
    t.string   "title"
    t.string   "menu_title"
    t.text     "announce"
    t.text     "body"
    t.string   "preview_file_name"
    t.string   "preview_content_type"
    t.integer  "preview_file_size"
    t.datetime "preview_updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.string   "alias"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "users", force: true do |t|
    t.boolean  "blocked",                default: false
    t.integer  "type_id"
    t.integer  "status_id"
    t.integer  "role_id"
    t.string   "phone"
    t.string   "mobile"
    t.string   "name"
    t.string   "surname"
    t.string   "patronymic"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "users_roles", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users_roles", ["role_id"], name: "index_users_roles_on_role_id", using: :btree
  add_index "users_roles", ["user_id"], name: "index_users_roles_on_user_id", using: :btree

end
