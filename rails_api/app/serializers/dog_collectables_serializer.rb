class DogCollectablesSerializer < ActiveModel::Serializer
  attributes :id, :name, :img

  belongs_to :location
end
