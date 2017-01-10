require 'rails_helper'

RSpec.describe Apartment, type: :model do
  it 'can be instantiated' do
    expect{ Apartment.new }.to_not raise_error
  end

  it 'has a bunch of stupid variable that can be filled in and saved' do
    apartment = Apartment.new(street_1: '3064 Myrtle St', street_2: '', city: 'San Diego', state: 'CA', country: 'USA', zip: '92104', name: 'Peter', phone_number: '888-888-8888', availability: 'Whenever')
    expect(apartment.save).to eq true

    new_apartment = Apartment.find_by(street_1: '3064 Myrtle St')
    expect(new_apartment.city).to eq 'San Diego'
    expect(new_apartment.zip).to eq '92104'
    expect(new_apartment.phone_number).to eq '888-888-8888'
    expect(new_apartment.latitude).to be_a Float
    expect(new_apartment.longitude).to be_a Float

  end
end
