class CreateCategoriesHardwareParts < ActiveRecord::Migration
  def change
    create_table :categories_hardware_parts, :id => false do |t|
      t.references  :category
      t.references  :hardware_part
    end
    
    add_index :categories_hardware_parts, :category_id
    add_index :categories_hardware_parts, :hardware_part_id
  end
end
