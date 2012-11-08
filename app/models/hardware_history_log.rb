class HardwareHistoryLog < ActiveRecord::Base
  belongs_to :hardware_part
  attr_accessible :entry
end
