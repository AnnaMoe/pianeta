class AddLabelToPlanets < ActiveRecord::Migration[6.0]
  def change
    add_column :planets, :labels, :string
  end
end
