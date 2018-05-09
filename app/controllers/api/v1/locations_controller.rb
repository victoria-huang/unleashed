class Api::V1::LocationsController < ApplicationController
  before_action :set_location, only: %i[show update destroy]

  def index
    locations = Location.all
    render json: locations, status: 200
  end

  def create
    location = Location.create(location_params)
    render json: location, status: 201
  end

  def update
    @location.update(location_params)
    render json: @location, status: 200
  end

  def reset
    reset_npcs_and_collectables
    locations = Location.all
    render json: locations, status: 200
  end

  def destroy
    locationId = @location.id
    @location.destroy
    render json: { message: 'Zap! location deleted', locationId: locationId }
  end

  def show
    render json: @location, status: 200
  end

  private

  def location_params
    params.permit(:street, :ave, :latitude, :longitude)
  end

  def set_location
    @location = Location.find(params[:id])
  end

  private

  def getRandomLocationId
    rand = Location.offset(rand(Location.count)).first.id
    while DogCollectable.find_by(location_id: rand) && Npc.find_by(location_id: rand)
      rand = Location.offset(rand(Location.count)).first.id
    end
    rand
  end

  def validLocation(collectable, str, ave)
    oldLoc = Location.find(collectable.location_id)
    a = oldLoc.ave
    st = oldLoc.street

    new_ave = if Location.find_by(ave: (a.to_i + ave).to_s)
                a.to_i + ave
              else
                a.to_i - ave
              end

    new_str = if Location.find_by(street: (st.to_i + str).to_s)
                st.to_i + str
              else
                st.to_i - str
              end

    Location.find_by(street: new_str, ave: new_ave)
  end

  def reset_npcs_and_collectables
    Npc.delete_all
    DogCollectable.delete_all

    c1 = DogCollectable.create(name: 'a Peanut Butter Biscuit', img: 'images/collectables/biscuit_1.png', location_id: getRandomLocationId)
    c2 = DogCollectable.create(name: 'a Soft Chew Toy', img: 'images/collectables/toy_3.png', location_id: getRandomLocationId)
    c3 = DogCollectable.create(name: 'a Woody Costume', img: 'images/collectables/costume_1.png', location_id: getRandomLocationId)

    c4 = DogCollectable.create(name: 'a Dog Bone', img: 'images/collectables/bone_2.png', location_id: getRandomLocationId)
    c5 = DogCollectable.create(name: 'a Comfy Bed', img: 'images/collectables/dog_bed.png', location_id: getRandomLocationId)
    c6 = DogCollectable.create(name: 'your friend, Chase the Shiba,', img: 'images/collectables/shiba.gif', location_id: getRandomLocationId)

    c7 = DogCollectable.create(name: 'a Tennis Ball', img: 'images/collectables/tennis_ball.png', location_id: getRandomLocationId)
    c8 = DogCollectable.create(name: 'a Stick', img: 'images/collectables/stick.png', location_id: getRandomLocationId)
    c9 = DogCollectable.create(name: 'your friend, Annoying Dog,', img: 'images/collectables/annoying.gif', location_id: getRandomLocationId)

    c10 = DogCollectable.create(name: 'your friend, Lana Del Corgi,', img: 'images/collectables/corgi.gif', location_id: getRandomLocationId)
    c11 = DogCollectable.create(name: 'your friend, Christian,', img: 'images/collectables/christian.png', location_id: getRandomLocationId)
    collectables = [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11] # , c11, c12, c13, c14] #, c15, c16, c17, c18, c19, c20]

    collectables.each_with_index do |collectable, i|
      str = rand(1...4)
      ave = rand(1...4)

      loc = validLocation(collectable, str, ave)

      while DogCollectable.find_by(location_id: loc.id) && Npc.find_by(location_id: loc.id)
        str = rand(1...4)
        ave = rand(1...4)

        loc = validLocation(collectable, str, ave)
      end

      Npc.create(name: Faker::Name.first_name, dialogue: "I think I saw #{collectable.name} #{str} #{str > 1 ? 'streets' : 'street'} away and #{ave} #{ave > 1 ? 'avenues' : 'avenue'} away", img: "images/people/s#{i + 1}.png", location_id: loc.id)
    end
  end
end
