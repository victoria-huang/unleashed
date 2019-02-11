class CreateDogCollectables < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_collectables do |t|
      t.string :name
      t.string :img
      t.integer :location_id
    end
  end
end
