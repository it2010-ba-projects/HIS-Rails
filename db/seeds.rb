# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Gruppen anlegen
Group::GROUPS.each do |group|
  Group.find_or_create_by_name group
end

# Status anlegen
State::STATES.each do |state|
  State.find_or_create_by_name state
end
