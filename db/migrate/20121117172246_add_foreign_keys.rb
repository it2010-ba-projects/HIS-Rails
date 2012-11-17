class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key "categories_hardware_parts", "categories", :name => "categories_hardware_parts_category_id_fk", :dependent => :restrict
    add_foreign_key "categories_hardware_parts", "hardware_parts", :name => "categories_hardware_parts_hardware_part_id_fk", :dependent => :restrict
    add_foreign_key "categories", "categories", :name => "categories_parent_id_fk", :column => "parent_id", :dependent => :restrict
    add_foreign_key "groups_users", "groups", :name => "groups_users_group_id_fk", :dependent => :restrict
    add_foreign_key "groups_users", "users", :name => "groups_users_user_id_fk", :dependent => :restrict
    add_foreign_key "hardware_history_logs", "hardware_parts", :name => "hardware_history_logs_hardware_part_id_fk", :dependent => :restrict
    add_foreign_key "hardware_parts", "manufacturers", :name => "hardware_parts_manufacturer_id_fk", :dependent => :restrict
    add_foreign_key "hardware_parts", "owners", :name => "hardware_parts_owner_id_fk", :dependent => :restrict
    add_foreign_key "hardware_parts", "hardware_parts", :name => "hardware_parts_parent_id_fk", :column => "parent_id", :dependent => :restrict
    add_foreign_key "hardware_parts", "places", :name => "hardware_parts_place_id_fk", :dependent => :restrict
    add_foreign_key "hardware_parts", "states", :name => "hardware_parts_state_id_fk", :dependent => :restrict
    add_foreign_key "user_histories", "users", :name => "user_histories_user_id_fk", :dependent => :restrict
  end
end
