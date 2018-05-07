class Location < ApplicationRecord
  has_many :npcs
  has_many :dog_collectables
end
