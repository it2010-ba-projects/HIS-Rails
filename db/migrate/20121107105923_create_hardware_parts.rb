class CreateHardwareParts < ActiveRecord::Migration
  def change
    create_table :hardware_parts do |t|
      t.string :inventory_number
      t.string :name
      t.date :purchase_date
      t.date :warranty_end
      t.references :place
      t.references :owner
      t.references :state
      t.references :manufacturer
      t.references :parent

      t.timestamps
    end
    add_index :hardware_parts, :place_id
    add_index :hardware_parts, :owner_id
    add_index :hardware_parts, :state_id
    add_index :hardware_parts, :manufacturer_id
    add_index :hardware_parts, :parent_id
  end
end
