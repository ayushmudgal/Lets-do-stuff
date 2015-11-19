# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category_names = [

  { name: 'Sports' },
  { name: 'Food' },
  { name: 'Exercise' },
  { name: 'Religion' },
  { name: 'Music' },
  { name: 'Health' },
  { name: 'Gaming' },

]

category_names.each do |cat|
  Category.create(cat) unless Category.where(cat).first
end
