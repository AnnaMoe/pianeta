class ChangeColumnDescriptionOfPlanets < ActiveRecord::Migration[6.0]
  def change
    change_column :planets, :description, :text
  end
end
