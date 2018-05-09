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
    loc = Location.offset(rand(Location.count)).first.id
    while DogCollectable.find_by(location_id: loc)
      loc = Location.offset(rand(Location.count)).first.id
    end
    loc
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

    Location.find_by(street: new_str.to_s, ave: new_ave.to_s)
  end

  def reset_npcs_and_collectables
    Npc.delete_all
    DogCollectable.delete_all

    c1 = DogCollectable.create(name: 'a Peanut Butter Biscuit', img: 'https://dl.dropboxusercontent.com/s/oqpqqqklhgmp7n1/biscuit_1.png?dl=0', location_id: getRandomLocationId())
    c2 = DogCollectable.create(name: 'a Soft Chew Toy', img: 'https://dl.dropboxusercontent.com/s/bg9i3t6oyug4wm3/toy_3.png?dl=0', location_id: getRandomLocationId())
    c3 = DogCollectable.create(name: 'a Woody Costume', img: 'https://dl.dropboxusercontent.com/s/pdd5rwatae30e8c/costume_1.png?dl=0', location_id: getRandomLocationId())

    c4 = DogCollectable.create(name: 'a Dog Bone', img: 'https://dl.dropboxusercontent.com/s/ixhbr03m2yifbny/bone_2.png?dl=0', location_id: getRandomLocationId())
    c5 = DogCollectable.create(name: 'a Comfy Bed', img: 'https://dl.dropboxusercontent.com/s/v82be3mo3oxc8n5/dog_bed.png?dl=0', location_id: getRandomLocationId())
    c6 = DogCollectable.create(name: 'your friend, Chase the Shiba,', img: 'https://dl.dropboxusercontent.com/s/5bq1dztwogtuizv/shiba.gif?dl=0', location_id: getRandomLocationId())

    c7 = DogCollectable.create(name: 'a Tennis Ball', img: 'https://dl.dropboxusercontent.com/s/zo1uzg507q93c4i/tennis_ball.png?dl=0', location_id: getRandomLocationId())
    c8 = DogCollectable.create(name: 'a Stick', img: 'https://dl.dropboxusercontent.com/s/i0pi0iz3h9auw9b/stick.png?dl=0', location_id: getRandomLocationId())
    c9 = DogCollectable.create(name: 'your friend, Annoying Dog,', img: 'https://dl.dropboxusercontent.com/s/qhj5gzgqspecv9q/annoying.gif?dl=0', location_id: getRandomLocationId())

    c10 = DogCollectable.create(name: 'your friend, Lana Del Corgi,', img: 'https://dl.dropboxusercontent.com/s/w3980hv8d3u7u9j/corgi.gif?dl=0', location_id: getRandomLocationId())
    c11 = DogCollectable.create(name: 'your friend, Christian,', img: 'https://dl.dropboxusercontent.com/s/o19wbmxczji179n/christian.png?dl=0', location_id: getRandomLocationId())
    collectables = [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11] #, c11, c12, c13, c14] #, c15, c16, c17, c18, c19, c20]
    collect_images = [
      'https://dl.dropboxusercontent.com/s/qcla74246r0ih4s/s1.png?dl=0',
      'https://dl.dropboxusercontent.com/s/wa0i9iv0qispnyy/s2.png?dl=0',
      'https://dl.dropboxusercontent.com/s/f6bycyik5tzpnf8/s3.png?dl=0',
      'https://dl.dropboxusercontent.com/s/7j3wwerua23egcm/s4.png?dl=0',
      'https://dl.dropboxusercontent.com/s/pqkg4lkoi4yacas/s5.png?dl=0',
      'https://dl.dropboxusercontent.com/s/by1k0c9clzcjev6/s6.png?dl=0',
      'https://dl.dropboxusercontent.com/s/dl87htwv3fzv3tx/s7.png?dl=0',
      'https://dl.dropboxusercontent.com/s/inoxj5trrihulfe/s8.png?dl=0',
      'https://dl.dropboxusercontent.com/s/fx2cmuouixuyw1w/s9.png?dl=0',
      'https://dl.dropboxusercontent.com/s/58qd3h8rwupdfqf/s10.png?dl=0',
      'https://dl.dropboxusercontent.com/s/fuxmopk1ekkbs8g/s11.png?dl=0'
    ]

    collectables.each_with_index do |collectable, i|
      str = rand(1...4)
      ave = rand(1...4)

      loc = validLocation(collectable, str, ave)

      while DogCollectable.find_by(location_id: loc.id) || Npc.find_by(location_id: loc.id)
        str = rand(1...4)
        ave = rand(1...4)

        loc = validLocation(collectable, str, ave)
      end
      Npc.create(name: Faker::Name.first_name, dialogue: "I think I saw #{collectable.name} #{str} #{str > 1 ? 'streets' : 'street'} away and #{ave} #{ave > 1 ? 'avenues' : 'avenue'} away", img: collect_images[i], location_id: loc.id)
    end
  end
end
