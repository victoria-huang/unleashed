require 'faker'
Location.delete_all

Location.create!([
  {street: "14", ave: "1", latitude: 40.7312857466366, longitude: -73.9826037269086},
  {street: "14", ave: "2", latitude: 40.7322942931704, longitude: -73.9849426131696},
  {street: "14", ave: "3", latitude: 40.7332702913897, longitude: -73.9871312957257},
  {street: "14", ave: "4", latitude: 40.7346691972037, longitude: -73.9904143195599},
  {street: "14", ave: "5", latitude: 40.7359379468079, longitude: -73.9935900550336},
  {street: "14", ave: "6", latitude: 40.7373042654764, longitude: -73.9968730788678},
  {street: "14", ave: "7", latitude: 40.7385241691463, longitude: -73.9996196608991},
  {street: "14", ave: "8", latitude: 40.7396800875005, longitude: -74.002497503534},
  {street: "14", ave: "9", latitude: 40.740965006179, longitude: -74.0053299162537},
  {street: "15", ave: "1", latitude: 40.7320394066095, longitude: -73.9821568876505},
  {street: "15", ave: "2", latitude: 40.7329991419856, longitude: -73.9844528585673},
  {street: "15", ave: "3", latitude: 40.7339425971669, longitude: -73.9867059141398},
  {street: "15", ave: "4", latitude: 40.7353252228319, longitude: -73.9898816496134},
  {street: "15", ave: "5", latitude: 40.7366752884011, longitude: -73.9931003004313},
  {street: "15", ave: "6", latitude: 40.738025326573, longitude: -73.9963618665934},
  {street: "15", ave: "7", latitude: 40.7392126868986, longitude: -73.9992157369852},
  {street: "15", ave: "8", latitude: 40.7404181100234, longitude: -74.002079917118},
  {street: "15", ave: "9", latitude: 40.7416379565904, longitude: -74.0048264991492},
  {street: "16", ave: "1", latitude: 40.7326247790599, longitude: -73.9816520456225},
  {street: "16", ave: "2", latitude: 40.7336495717241, longitude: -73.9840982202441},
  {street: "16", ave: "3", latitude: 40.7345930176822, longitude: -73.9862654451281},
  {street: "16", ave: "4", latitude: 40.73594309811, longitude: -73.9894197229296},
  {street: "16", ave: "5", latitude: 40.737341947725, longitude: -73.9926812890917},
  {street: "16", ave: "6", latitude: 40.7386594419758, longitude: -73.9958999399096},
  {street: "16", ave: "7", latitude: 40.7398793207944, longitude: -73.9987752679736},
  {street: "16", ave: "8", latitude: 40.7410834201317, longitude: -74.0016263723374},
  {street: "16", ave: "9", latitude: 40.7422544615524, longitude: -74.0044587850571},
  {street: "17", ave: "1", latitude: 40.7332357546739, longitude: -73.9812417514622},
  {street: "17", ave: "2", latitude: 40.7342280053685, longitude: -73.9835806377232},
  {street: "17", ave: "3", latitude: 40.7351714431243, longitude: -73.9857907779515},
  {street: "17", ave: "4", latitude: 40.7365377775349, longitude: -73.9889665134251},
  {street: "17", ave: "5", latitude: 40.7379366146457, longitude: -73.9922066219151},
  {street: "17", ave: "6", latitude: 40.7392378320625, longitude: -73.9954681880772},
  {street: "17", ave: "7", latitude: 40.7404251707457, longitude: -73.998300600797},
  {street: "17", ave: "8", latitude: 40.7416568654106, longitude: -74.0011925250292},
  {street: "17", ave: "9", latitude: 40.7428441609142, longitude: -74.0040249377489},
  {street: "18", ave: "1", latitude: 40.7338386967166, longitude: -73.9807872846723},
  {street: "18", ave: "2", latitude: 40.7348634706834, longitude: -73.9831690862775},
  {street: "18", ave: "3", latitude: 40.7357906335286, longitude: -73.9853577688337},
  {street: "18", ave: "4", latitude: 40.7371406896532, longitude: -73.9885335043073},
  {street: "18", ave: "5", latitude: 40.7384907183804, longitude: -73.9918165281415},
  {street: "18", ave: "6", latitude: 40.7398575544438, longitude: -73.9950848836452},
  {street: "18", ave: "7", latitude: 40.74106114668, longitude: -73.9979172963649},
  {street: "18", ave: "8", latitude: 40.7422647171379, longitude: -74.0007067937404},
  {street: "18", ave: "9", latitude: 40.7434682658172, longitude: -74.0036250371486},
  {street: "19", ave: "1", latitude: 40.7344192607773, longitude: -73.9804039802402},
  {street: "19", ave: "2", latitude: 40.7354602917861, longitude: -73.9827428665012},
  {street: "19", ave: "3", latitude: 40.7363711805564, longitude: -73.9849959220737},
  {street: "19", ave: "4", latitude: 40.7377862865857, longitude: -73.9881501998752},
  {street: "19", ave: "5", latitude: 40.7391363022112, longitude: -73.9914546813816},
  {street: "19", ave: "6", latitude: 40.7404862904392, longitude: -73.9946518745273},
  {street: "19", ave: "7", latitude: 40.7416545614367, longitude: -73.9974924176932},
  {street: "19", ave: "8", latitude: 40.7427930644314, longitude: -74.0003033727408},
  {street: "19", ave: "9", latitude: 40.7440453952173, longitude: -74.0031787008047},
  {street: "20", ave: "1", latitude: 40.734959654729, longitude: -73.9798711426556},
  {street: "20", ave: "2", latitude: 40.7360006772821, longitude: -73.9823816902936},
  {street: "20", ave: "3", latitude: 40.7369603555178, longitude: -73.9844845421612},
  {street: "20", ave: "4", latitude: 40.7382615920306, longitude: -73.9877246506512},
  {street: "20", ave: "5", latitude: 40.7396441279368, longitude: -73.9909647591412},
  {street: "20", ave: "6", latitude: 40.7410103704857, longitude: -73.9942048676312},
  {street: "20", ave: "7", latitude: 40.7421806685176, longitude: -73.9970306586474},
  {street: "20", ave: "8", latitude: 40.7434330108342, longitude: -73.9999274443835},
  {street: "20", ave: "9", latitude: 40.7446365383729, longitude: -74.0027598571032},
  {street: "21", ave: "1", latitude: 40.7355153065736, longitude: -73.9794965554029},
  {street: "21", ave: "2", latitude: 40.7366213832574, longitude: -73.9818998146802},
  {street: "21", ave: "3", latitude: 40.7375485216037, longitude: -73.9841314125806},
  {street: "21", ave: "4", latitude: 40.7389310723297, longitude: -73.9873071480543},
  {street: "21", ave: "5", latitude: 40.7402647999171, longitude: -73.9905901718885},
  {street: "21", ave: "6", latitude: 40.7416045231793, longitude: -73.9938206411898},
  {street: "21", ave: "7", latitude: 40.7428080838048, longitude: -73.9966101385653},
  {street: "21", ave: "8", latitude: 40.7440116226519, longitude: -73.999442551285},
  {street: "21", ave: "9", latitude: 40.7451663489113, longitude: -74.0022320486605},
  {street: "22", ave: "1", latitude: 40.7361989993153, longitude: -73.9790141768754},
  {street: "22", ave: "2", latitude: 40.7372074713733, longitude: -73.9814603514969},
  {street: "22", ave: "3", latitude: 40.7381833975188, longitude: -73.9836704917252},
  {street: "22", ave: "4", latitude: 40.7395008751047, longitude: -73.9869320578873},
  {street: "22", ave: "5", latitude: 40.7409159145587, longitude: -73.9900648780167},
  {street: "22", ave: "6", latitude: 40.7422281668088, longitude: -73.9932860434055},
  {street: "22", ave: "7", latitude: 40.7434154521144, longitude: -73.9961613714695},
  {street: "22", ave: "8", latitude: 40.7445864524773, longitude: -73.9989723265171},
  {street: "22", ave: "9", latitude: 40.7458387494951, longitude: -74.0018691122532},
  {street: "23", ave: "1", latitude: 40.73684851309, longitude: -73.9785001985729},
  {street: "23", ave: "2", latitude: 40.737856975302, longitude: -73.9808820001781},
  {street: "23", ave: "3", latitude: 40.7387840964283, longitude: -73.9831565134227},
  {street: "23", ave: "4", latitude: 40.740134091804, longitude: -73.986439537257},
  {street: "23", ave: "5", latitude: 40.7415491177877, longitude: -73.9896152727306},
  {street: "23", ave: "6", latitude: 40.7429381187766, longitude: -73.9928654395044},
  {street: "23", ave: "7", latitude: 40.7441253914091, longitude: -73.9957193098962},
  {street: "23", ave: "8", latitude: 40.7453289064188, longitude: -73.9984444342554},
  {street: "23", ave: "9", latitude: 40.7464930866521, longitude: -74.0013804472983}
])

Npc.delete_all
DogCollectable.delete_all

def getRandomLocationId
  rand = Location.offset(rand(Location.count)).first.id
  while DogCollectable.find_by(location_id: rand)
    rand = Location.offset(rand(Location.count)).first.id
  end
  rand
end

c1 = DogCollectable.create(name: 'a Peanut Butter Biscuit', img: 'images/collectables/biscuit_1.png', location_id: getRandomLocationId())
c2 = DogCollectable.create(name: 'a Soft Chew Toy', img: 'images/collectables/toy_3.png', location_id: getRandomLocationId())
c3 = DogCollectable.create(name: 'a Woody Costume', img: 'images/collectables/costume_1.png', location_id: getRandomLocationId())

c4 = DogCollectable.create(name: 'a Dog Bone', img: 'images/collectables/bone_2.png', location_id: getRandomLocationId())
c5 = DogCollectable.create(name: 'a Comfy Bed', img: 'images/collectables/dog_bed.png', location_id: getRandomLocationId())
c6 = DogCollectable.create(name: 'your friend, Chase the Shiba,', img: 'images/collectables/shiba.gif', location_id: getRandomLocationId())

c7 = DogCollectable.create(name: 'a Tennis Ball', img: 'images/collectables/tennis_ball.png', location_id: getRandomLocationId())
c8 = DogCollectable.create(name: 'a Stick', img: 'images/collectables/stick.png', location_id: getRandomLocationId())
c9 = DogCollectable.create(name: 'your friend, Annoying Dog,', img: 'images/collectables/annoying.gif', location_id: getRandomLocationId())

c10 = DogCollectable.create(name: 'your friend, Lana Del Corgi,', img: 'images/collectables/corgi.gif', location_id: getRandomLocationId())

collectables = [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10] #, c11, c12, c13, c14] #, c15, c16, c17, c18, c19, c20]

def validLocation(collectable, str, ave)
  oldLoc = Location.find(collectable.location_id)
  a = oldLoc.ave
  st = oldLoc.street

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

  Location.find_by(street: new_str, ave: new_ave)
end

collectables.each_with_index do |collectable, i|
  str = rand(1...4)
  ave = rand(1...4)

  loc = validLocation(collectable, str, ave)

  while DogCollectable.find_by(location_id: loc.id) && Npc.find_by(location_id: loc.id)
    str = rand(1...4)
    ave = rand(1...4)

    loc = validLocation(collectable, str, ave)
  end

  Npc.create(name: Faker::Name.name, dialogue: "I think I saw #{collectable.name} #{str} #{str > 1 ? 'streets' : 'street'} away and #{ave} #{ave > 1 ? 'avenues' : 'avenue'} away", img: "images/people/s#{i + 1}.png", location_id: loc.id)
end



# DogCollectable.create!([
#   {name: "Peanut Butter Biscuit", img: "images/collectables/biscuit_1.png", location_id: 131},
#   {name: "Soft Chew Toy", img: "images/collectables/toy_3.png", location_id: 143},
#   {name: "Woody Costume", img: "images/collectables/costume_1.png", location_id: 129},
#   {name: "Dog Bone", img: "images/collectables/bone_2.png", location_id: 147},
#   {name: "Comfy Bed", img: "images/collectables/dog_bed.png", location_id: 140},
#   {name: "Chase the Shiba", img: "images/collectables/shiba.gif", location_id: 113},
#   {name: "Tennis Ball", img: "images/collectables/tennis_ball.png", location_id: 194},
#   {name: "Stick", img: "images/collectables/stick.png", location_id: 156},
#   {name: "Annoying Dog", img: "images/collectables/annoying.gif", location_id: 171},
#   {name: "Lana Del Corgi", img: "images/collectables/corgi.gif", location_id: 187}
# ])
#
# Npc.create!([
#   {name: "Jedediah Ullrich", dialogue: "There's a(n) Peanut Butter Biscuit 2 streets away and 2 avenues away", img: "images/people/s1.png", location_id: 151},
#   {name: "Crystel Lueilwitz", dialogue: "There's a(n) Soft Chew Toy 2 streets away and 3 avenues away", img: "images/people/s2.png", location_id: 158},
#   {name: "Letitia Konopelski", dialogue: "There's a(n) Woody Costume 3 streets away and 3 avenues away", img: "images/people/s3.png", location_id: 159},
#   {name: "Dagmar Tremblay", dialogue: "There's a(n) Dog Bone 3 streets away and 1 avenue away", img: "images/people/s4.png", location_id: 175},
#   {name: "Dr. Max Connelly", dialogue: "There's a(n) Comfy Bed 3 streets away and 3 avenues away", img: "images/people/s5.png", location_id: 170},
#   {name: "Maximus Klein Sr.", dialogue: "There's a(n) Chase the Shiba 1 street away and 3 avenues away", img: "images/people/s6.png", location_id: 125},
#   {name: "Jena Langworth", dialogue: "There's a(n) Tennis Ball 3 streets away and 2 avenues away", img: "images/people/s7.png", location_id: 169},
#   {name: "Dr. Marina Langosh", dialogue: "There's a(n) Stick 1 street away and 1 avenue away", img: "images/people/s8.png", location_id: 166},
#   {name: "Houston Hettinger", dialogue: "There's a(n) Annoying Dog 3 streets away and 2 avenues away", img: "images/people/s9.png", location_id: 196},
#   {name: "Dr. Stanley Swift", dialogue: "There's a(n) Lana Del Corgi 2 streets away and 2 avenues away", img: "images/people/s10.png", location_id: 171}
# ])
