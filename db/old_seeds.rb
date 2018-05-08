require 'faker'
# east_west = ['1st Avenue', '2nd Avenue', '3rd Avenue', '5th Avenue', '6th Avenue', '7th Avenue', '8th Avenue', '9th Avenue']
# north_south = ['14th St', '15th St', '16th St', '17th St', '18th St', '19th St', '20th St', '21st St', '22nd St', '23rd St', '24th St', '25th St', '26th St', '27th St', '28th St', '29th St', '30th St', '31st St', '32nd St', '33rd St', '34th St', '35th St', '36th St', '37th St', '38th St', '40th St', '41st St', '42nd St']
Npc.delete_all
DogCollectable.delete_all
# 8th and 32nd
# 9th and 32nd
# 9th and 27th
#
# north_south.each do |street|
#   east_west.each do |ave|
#     if !(street == '27th St' && ave == '9th Avenue') && !(street == '32th St' && ave == '9th Avenue') && !(street == '27th St' && ave == 'th Avenue')
#       Location.create(street: street, ave: ave)
#     end
#   end
# end
# offset =
# rand_record = Location.offset(rand(Location.count)).first.id

def getRandomLocationId
  rand = Location.offset(rand(Location.count)).first.id
  while DogCollectable.find_by(location_id: rand)
    rand = Location.offset(rand(Location.count)).first.id
  end
  rand
end

c1 = DogCollectable.create(name: 'Peanut Butter Biscuit', img: 'images/collectables/biscuit_1.png', location_id: getRandomLocationId())
c2 = DogCollectable.create(name: 'Soft Chew Toy', img: 'images/collectables/toy_3.png', location_id: getRandomLocationId())
c3 = DogCollectable.create(name: 'Woody Costume', img: 'images/collectables/costume_1.png', location_id: getRandomLocationId())

c4 = DogCollectable.create(name: 'Dog Bone', img: 'images/collectables/bone_2.png', location_id: getRandomLocationId())
c5 = DogCollectable.create(name: 'Comfy Bed', img: 'images/collectables/dog_bed.png', location_id: getRandomLocationId())
c6 = DogCollectable.create(name: 'Chase the Shiba', img: 'images/collectables/shiba.gif', location_id: getRandomLocationId())

c7 = DogCollectable.create(name: 'Tennis Ball', img: 'images/collectables/tennis_ball.png', location_id: getRandomLocationId())
c8 = DogCollectable.create(name: 'Stick', img: 'images/collectables/stick.png', location_id: getRandomLocationId())
c9 = DogCollectable.create(name: 'Annoying Dog', img: 'images/collectables/annoying.gif', location_id: getRandomLocationId())

c10 = DogCollectable.create(name: 'Lana Del Corgi', img: 'images/collectables/corgi.gif', location_id: getRandomLocationId())

# c11 = DogCollectable.create(name: 'Soft Chew Toy', img: '', location_id: 205)
# c12 = DogCollectable.create(name: 'Crinkly Chew Toy', img: '', location_id: 34)
#
# c13 = DogCollectable.create(name: 'Woody Costume', img: '', location_id: 12)
# c14 = DogCollectable.create(name: 'School Girl Costume', img: '', location_id: 208)
#
# c15 = DogCollectable.create(name: 'A pair of socks', img: '', location_id: 204)
# c16 = DogCollectable.create(name: 'A pair of socks', img: '', location_id: 223)
#
# c17 = DogCollectable.create(name: 'Comfy Bed', img: '', location_id: 143)
#
# c18 = DogCollectable.create(name: 'Chase the Shiba', img: 'app/assets/images/dogs/shiba.gif', location_id: 79)
# c19 = DogCollectable.create(name: 'Annoying Dog', img: 'app/assets/images/dogs/annoying.gif', location_id: 36)
# c20 = DogCollectable.create(name: 'Lana Del Corgi', img: 'app/assets/images/dogs/corgi.gif', location_id: 270)

collectables = [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10] #, c11, c12, c13, c14] #, c15, c16, c17, c18, c19, c20]

collectables.each_with_index do |collectable, i|
  str = rand(1...4)
  ave = rand(1...4)

  oldLoc = Location.find(collectable.location_id)
  a = oldLoc.ave
  st = oldLoc.street
  # byebug
  # new_ave = 0
  # new_street = 0
  if(Location.find_by(ave: "#{a.to_i + ave}"))
    new_ave = a.to_i + ave
  else
    new_ave = a.to_i - ave
  end

  if(Location.find_by(street: "#{st.to_i + str}"))
    new_str = st.to_i + str
  else
    new_str = st.to_i - str
  end

  loc = Location.find_by(street: new_str, ave: new_ave)
  Npc.create(name: Faker::Name.name, dialogue: "There's a(n) #{collectable.name} #{str} #{str > 1 ? 'streets' : 'street'} away and #{ave} #{ave > 1 ? 'avenues' : 'avenue'} away", img: "images/people/s#{i + 1}.png", location_id: loc.id)
end
