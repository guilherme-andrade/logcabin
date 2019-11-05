# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'colorize'


Property.destroy_all
puts "> Deleted All Properties".upcase.colorize(:red)
User.destroy_all
puts "> Deleting All Users".upcase.colorize(:red)

users = [
	{
		name: 'Niko',
		email: 'niko@lewagon.org',
		password: '123456'	
	},
	{
		name: 'Gui',
		email: 'gui@lewagon.org',
		password: '123456'
	}
]


users.each do |user_attrs|
	user = User.create(user_attrs)
	puts "\n=============\n\n"
	puts "> Created User #{user.name}".colorize(:yellow)

	rand(5..10).times do
		street = Faker::Address.street_name
		picture = 'https://source.unsplash.com/random/1600x900?apartment'

		property = Property.create({
			name: "#{street} Apartment",
			address: street,
			user: user
		})

		property.remote_photo_url = picture
		property.save
		puts ">> Created Property #{property.name}, owner: #{property.user.name}".colorize(:green)
	end
end
