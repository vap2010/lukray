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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141008035722) do




  create_table "album_files", :force => true do |t|
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "position",                :default => 1,     :null => false
    t.boolean  "is_published",            :default => true,  :null => false
    t.integer  "album_id",                                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",                   :default => "abc", :null => false
  end

  add_index "album_files", ["album_id"], :name => "index_album_files_on_album_id"

  create_table "albums", :force => true do |t|
    t.string   "title"
    t.string   "albumable_type",                :null => false
    t.integer  "albumable_id",                  :null => false
    t.integer  "position",       :default => 1, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "albums", ["albumable_id", "albumable_type"], :name => "index_albums_on_albumable_id_and_albumable_type"

  create_table "articles", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "skin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",               :default => 1,     :null => false
    t.boolean  "is_deleted",             :default => false, :null => false
    t.boolean  "is_published",           :default => true,  :null => false
    t.boolean  "are_children_published", :default => true,  :null => false
    t.boolean  "is_shown_in_menu",       :default => false, :null => false
    t.boolean  "is_preview_published",   :default => false, :null => false
    t.string   "title",                                     :null => false
    t.text     "preview"
    t.text     "body"
    t.string   "unikey"
  end

  add_index "articles", ["parent_id"], :name => "index_articles_on_parent_id"







  create_table "events", :force => true do |t|
    t.integer  "skin_id"
    t.boolean  "is_deleted",           :default => false, :null => false
    t.boolean  "is_published",         :default => true,  :null => false
    t.boolean  "is_shown_in_menu",     :default => false, :null => false
    t.boolean  "is_preview_published", :default => false, :null => false
    t.string   "title",                                   :null => false
    t.text     "preview"
    t.text     "body"
    t.datetime "published_at",                            :null => false
    t.datetime "published_until"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unikey"
  end

  create_table "meta_tags", :force => true do |t|
    t.text     "title"
    t.text     "description"
    t.text     "keywords"
    t.string   "url"
    t.integer  "metatagable_id",                      :null => false
    t.string   "metatagable_type",                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "noindex",          :default => false, :null => false
    t.boolean  "nofollow",         :default => false, :null => false
    t.boolean  "is_redirect",      :default => false
    t.string   "redirect_uri"
    t.boolean  "is_meta_no_edit",  :default => false
    t.boolean  "is_hand_control",  :default => false
    t.integer  "hits_count",       :default => 0
    t.boolean  "no_cache",         :default => false
  end

  add_index "meta_tags", ["metatagable_id", "metatagable_type"], :name => "index_meta_tags_on_metatagable_id_and_metatagable_type"

  create_table "order_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "parent_product_id"
    t.integer  "position"
    t.string   "class_name"
    t.integer  "amount"
    t.string   "price"
    t.integer  "discount"
    t.string   "valuta"
    t.datetime "term"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.boolean  "is_actual",            :default => true
    t.boolean  "is_deleted",           :default => false
    t.integer  "user_id"
    t.integer  "client_id"
    t.integer  "status_id"
    t.datetime "date"
    t.string   "name",                                    :null => false
    t.string   "company"
    t.string   "phone"
    t.string   "email"
    t.string   "town"
    t.string   "address"
    t.datetime "term"
    t.boolean  "analogue_is_possible", :default => true
    t.boolean  "urgently",             :default => false
    t.string   "promo_kod"
    t.integer  "discount",             :default => 0
    t.text     "commentary"
    t.integer  "kod",                  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end


  create_table "rich_rich_files", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rich_file_file_name"
    t.string   "rich_file_content_type"
    t.integer  "rich_file_file_size"
    t.datetime "rich_file_updated_at"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.text     "uri_cache"
    t.string   "simplified_type",        :default => "file"
  end



  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",      :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",      :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                                  :default => "guest"
    t.text     "access_area"
    t.integer  "manager_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vacancies", :force => true do |t|
    t.integer  "skin_id"
    t.integer  "position",             :default => 1,     :null => false
    t.boolean  "is_deleted",           :default => false, :null => false
    t.boolean  "is_published",         :default => true,  :null => false
    t.boolean  "is_shown_in_menu",     :default => false, :null => false
    t.boolean  "is_preview_published", :default => false, :null => false
    t.string   "title",                                   :null => false
    t.text     "preview"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "web_orders", :force => true do |t|
    t.boolean  "is_order",    :default => false
    t.boolean  "is_actual",   :default => true
    t.boolean  "is_deleted",  :default => false
    t.datetime "date"
    t.string   "name",                           :null => false
    t.string   "company"
    t.string   "phone",                          :null => false
    t.string   "email"
    t.string   "town"
    t.string   "address"
    t.string   "mark"
    t.string   "subject"
    t.text     "commentary"
    t.integer  "meta_tag_id"
    t.string   "site_page"
    t.string   "referer"
    t.integer  "kod",         :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
