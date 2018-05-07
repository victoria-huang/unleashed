class CreateNpcs < ActiveRecord::Migration[5.2]
  def change
    create_table :npcs do |t|
      t.string :name
      t.string :dialogue
      t.string :img
      t.integer :location_id
    end
  end
end
