class LocationSerializer < ActiveModel::Serializer
  attributes :id, :street, :ave, :latitude, :longitude

  has_many :npcs
  has_many :dog_collectables
end
