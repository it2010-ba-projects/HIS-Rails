class Place < ActiveRecord::Base
  has_many        :hardware_parts
  attr_accessible :name
end
