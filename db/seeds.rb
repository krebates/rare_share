# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#

ROLES = [
  { name: "Patient", id: 1 },
  { name: "Family/Friend", id: 2 },
  { name: "Physician", id: 3 },
  { name: "Nurse", id: 4 },
  { name: "Scientist", id: 5 },
  { name: "No Role Specified", id: 6 },
]

ROLES.each do |role_attribute|
  role = Role.where(id: role_attribute[:id]).first_or_initialize
  role.update_attributes!(role_attribute.except(:id))
end
