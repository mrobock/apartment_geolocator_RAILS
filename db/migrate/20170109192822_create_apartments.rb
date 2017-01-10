class CreateApartments < ActiveRecord::Migration[5.0]
  def change
    create_table :apartments do |t|
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :zip
      t.string :state
      t.string :country
      t.string :name
      t.string :phone_number
      t.string :availability

      t.timestamps
    end
  end
end
