class NpcSerializer < ActiveModel::Serializer
  attributes :id, :name, :dialogue, :img

  belongs_to :location
end
