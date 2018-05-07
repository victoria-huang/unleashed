# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Npc.delete_all
DogCollectable.delete_all
Location.delete_all

# vicky = Npc.create(name: "vicky", dialogue: "There's a ")
#
east_west = ['1st Avenue', '2nd Avenue', '3rd Avenue', 'Lexington Avenue', 'Park Avenue', 'Madison Avenue', '5th Avenue']
north_south = ['2nd St', '3rd St', '4th St', '5th St', '6th St', '7th St', '8th St', '9th St', '10th St', '11th St', '12th St', '13th St', '14th St', '15th St', '16th St', '17th St', '18th St', '19th St', '20th St', '21st St', '22nd St', '23rd St', '24th St', '25th St', '26th St', '27th St', '28th St', '29th St', '30th St', '31st St', '32nd St', '33rd St', '34th St', '35th St', '36th St', '37th St', '38th St', '40th St', '41st St', '42nd St']

north_south.each do |street|
  Location.create(street: street, ave: east_west[rand(east_west.length)])
end
