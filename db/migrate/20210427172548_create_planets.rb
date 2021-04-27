class CreatePlanets < ActiveRecord::Migration[6.0]
  def change
    create_table :planets do |t|
      t.integer :price
      t.string :title
      t.string :description
      t.string :name_of_inhabitants
      t.string :name_of_space_station
      t.string :name_of_galaxy
      t.string :language
      t.string :population_density
      t.string :climate
      t.integer :size
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
