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

ActiveRecord::Schema.define(:version => 20121117172246) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["parent_id"], :name => "index_categories_on_parent_id"

  create_table "categories_hardware_parts", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "hardware_part_id"
  end

  add_index "categories_hardware_parts", ["category_id"], :name => "index_categories_hardware_parts_on_category_id"
  add_index "categories_hardware_parts", ["hardware_part_id"], :name => "index_categories_hardware_parts_on_hardware_part_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups_users", :id => false, :force => true do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  add_index "groups_users", ["group_id"], :name => "index_groups_users_on_group_id"
  add_index "groups_users", ["user_id"], :name => "index_groups_users_on_user_id"

  create_table "hardware_history_logs", :force => true do |t|
    t.text     "entry"
    t.integer  "hardware_part_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "hardware_history_logs", ["hardware_part_id"], :name => "index_hardware_history_logs_on_hardware_part_id"

  create_table "hardware_parts", :force => true do |t|
    t.string   "inventory_number"
    t.string   "name"
    t.date     "pruchase_date"
    t.date     "warranty_end"
    t.integer  "place_id"
    t.integer  "owner_id"
    t.integer  "state_id"
    t.integer  "manufacturer_id"
    t.integer  "parent_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "hardware_parts", ["manufacturer_id"], :name => "index_hardware_parts_on_manufacturer_id"
  add_index "hardware_parts", ["owner_id"], :name => "index_hardware_parts_on_owner_id"
  add_index "hardware_parts", ["parent_id"], :name => "index_hardware_parts_on_parent_id"
  add_index "hardware_parts", ["place_id"], :name => "index_hardware_parts_on_place_id"
  add_index "hardware_parts", ["state_id"], :name => "index_hardware_parts_on_state_id"

  create_table "manufacturers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "owners", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "places", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_histories", :force => true do |t|
    t.text     "entry"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_histories", ["user_id"], :name => "index_user_histories_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login",                  :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "deleted"
    t.integer  "created_from_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["created_from_id"], :name => "index_users_on_created_from_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  add_foreign_key "categories", "categories", :name => "categories_parent_id_fk", :column => "parent_id", :dependent => :restrict

  add_foreign_key "categories_hardware_parts", "categories", :name => "categories_hardware_parts_category_id_fk", :dependent => :restrict
  add_foreign_key "categories_hardware_parts", "hardware_parts", :name => "categories_hardware_parts_hardware_part_id_fk", :dependent => :restrict

  add_foreign_key "groups_users", "groups", :name => "groups_users_group_id_fk", :dependent => :restrict
  add_foreign_key "groups_users", "users", :name => "groups_users_user_id_fk", :dependent => :restrict

  add_foreign_key "hardware_history_logs", "hardware_parts", :name => "hardware_history_logs_hardware_part_id_fk", :dependent => :restrict

  add_foreign_key "hardware_parts", "hardware_parts", :name => "hardware_parts_parent_id_fk", :column => "parent_id", :dependent => :restrict
  add_foreign_key "hardware_parts", "manufacturers", :name => "hardware_parts_manufacturer_id_fk", :dependent => :restrict
  add_foreign_key "hardware_parts", "owners", :name => "hardware_parts_owner_id_fk", :dependent => :restrict
  add_foreign_key "hardware_parts", "places", :name => "hardware_parts_place_id_fk", :dependent => :restrict
  add_foreign_key "hardware_parts", "states", :name => "hardware_parts_state_id_fk", :dependent => :restrict

  add_foreign_key "user_histories", "users", :name => "user_histories_user_id_fk", :dependent => :restrict

end
