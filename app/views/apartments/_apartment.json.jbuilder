json.extract! apartment, :id, :street_1, :street_2, :city, :zip, :state, :country, :name, :phone_number, :availability, :created_at, :updated_at
json.url apartment_url(apartment, format: :json)