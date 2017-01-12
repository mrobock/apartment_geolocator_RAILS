class AddOmniauthToOwners < ActiveRecord::Migration[5.0]
  def change
    add_column :owners, :provider, :string
    add_column :owners, :uid, :string
  end
end
