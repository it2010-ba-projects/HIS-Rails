class State < ActiveRecord::Base
  has_many        :hardware_parts
  attr_accessible :name
  
  STATES = [
    :lagernd, 
    :einsatz, 
    :garantierreparatur, 
    :aussondern, 
    :verkauft, 
    :verschrottet
  ]
end
