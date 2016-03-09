# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do 
	@rest = Restaurant.new
	@rest.name = '好吃滷肉飯'
	@rest.phone = '02-24566788'
	@rest.url = "www.facebook.com"
	@rest.save
end