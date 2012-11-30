class HardwarePart < ActiveRecord::Base
  belongs_to  :place
  belongs_to  :owner
  belongs_to  :state
  belongs_to  :manufacturer
  belongs_to  :parent, class_name: "HardwarePart"
  has_many    :children, class_name: "HardwarePart", foreign_key: "parent_id"
  
  has_and_belongs_to_many :categories
  has_many                :hardware_history_logs
  
  attr_accessible :parent_id, :inventory_number, :name, :purchase_date, :warranty_end, 
    :place_id, :owner_id, :state_id, :manufacturer_id
end
