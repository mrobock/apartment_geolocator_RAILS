class AddOwnerToApartment < ActiveRecord::Migration[5.0]
  def change
    add_reference :apartments, :owner, foreign_key: true
  end
end
