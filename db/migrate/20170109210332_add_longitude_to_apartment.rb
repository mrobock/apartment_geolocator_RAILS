class AddLongitudeToApartment < ActiveRecord::Migration[5.0]
  def change
    add_column :apartments, :longitude, :float
  end
end
