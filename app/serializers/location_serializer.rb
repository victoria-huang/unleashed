class LocationSerializer < ActiveModel::Serializer
  attributes :id, :street, :ave

  has_many :npcs
  has_many :dog_collectables
end
