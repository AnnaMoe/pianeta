class AddHostnameToPlanets < ActiveRecord::Migration[6.0]
  def change
    add_column :planets, :host_name, :string
  end
end
