# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Npc.delete_all
DogCollectable.delete_all
Location.delete_all

east_west = ['1st Avenue', '2nd Avenue', '3rd Avenue', '5th Avenue', '6th Avenue', '7th Avenue', '8th Avenue', '9th Avenue']
north_south = ['2nd St', '3rd St', '4th St', '5th St', '6th St', '7th St', '8th St', '9th St', '10th St', '11th St', '12th St', '13th St', '14th St', '15th St', '16th St', '17th St', '18th St', '19th St', '20th St', '21st St', '22nd St', '23rd St', '24th St', '25th St', '26th St', '27th St', '28th St', '29th St', '30th St', '31st St', '32nd St', '33rd St', '34th St', '35th St', '36th St', '37th St', '38th St', '40th St', '41st St', '42nd St']

north_south.each do |street|
  east_west.each do |ave|
    Location.create(street: street, ave: ave)
  end
end

c1 = DogCollectable.create(name: 'Peanut Butter Biscuit', img: '', location_id: 29)
c2 = DogCollectable.create(name: 'Chicken Biscuit', img: '', location_id: 237)
c3 = DogCollectable.create(name: 'Milk Biscuit', img: '', location_id: 104)

c4 = DogCollectable.create(name: 'Dog Bone', img: '', location_id: 21)
c5 = DogCollectable.create(name: 'Dog Bone', img: '', location_id: 176)
c6 = DogCollectable.create(name: 'Dog Bone', img: '', location_id: 95)

c7 = DogCollectable.create(name: 'Tennis Ball', img: '', location_id: 167)
c8 = DogCollectable.create(name: 'Stick', img: '', location_id: 141)
c9 = DogCollectable.create(name: 'Dog Tag', img: '', location_id: 116)

c10 = DogCollectable.create(name: 'Annoyingly Loud Chew Toy', img: '', location_id: 223)
c11 = DogCollectable.create(name: 'Soft Chew Toy', img: '', location_id: 275)
c12 = DogCollectable.create(name: 'Crinkly Chew Toy', img: '', location_id: 34)

c13 = DogCollectable.create(name: 'Woody Costume', img: '', location_id: 12)
c14 = DogCollectable.create(name: 'School Girl Costume', img: '', location_id: 280)

c15 = DogCollectable.create(name: 'A pair of socks', img: '', location_id: 204)
c16 = DogCollectable.create(name: 'A pair of socks', img: '', location_id: 223)

c17 = DogCollectable.create(name: 'Comfy Bed', img: '', location_id: 143)

c18 = DogCollectable.create(name: 'Chase the Shiba', img: 'app/assets/images/dogs/shiba.gif', location_id: 79)
c19 = DogCollectable.create(name: 'Annoying Dog', img: 'app/assets/images/dogs/annoying.gif', location_id: 36)
c20 = DogCollectable.create(name: 'Lana Del Corgi', img: 'app/assets/images/dogs/corgi.gif', location_id: 270)

collectables = [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20]

collectables.each_with_index do |collectable, i|
  str = rand(1...5)
  ave = rand(1...5)

  oldLoc = Location.find(collectable.location_id)
  aindex = east_west.index(oldLoc.ave)
  sindex = north_south.index(oldLoc.street)

  new_ave = aindex + ave >= east_west.length ? east_west[aindex - ave] : east_west[aindex + ave]
  new_str = sindex - str < 0 ? north_south[sindex + str] : north_south[sindex - str]
  loc = Location.find_by(street: new_str, ave: new_ave)

  Npc.create(name: Faker::Name.name, dialogue: "There's a(n) #{collectable.name} #{str} #{str > 1 ? 'streets' : 'street'} away and #{ave} #{ave > 1 ? 'avenues' : 'avenue'} away", img: "app/assets/images/people/s#{i + 1}", location_id: loc.id)
end
