require 'rails_helper'

RSpec.feature "AddApartments", type: :feature do
  context "Create an apartment" do
    Steps "for creating a new apartment" do
      Given "that I am on the registration page" do
        visit '/'
      end
      Then "I can go to the New Apartment page" do
        click_link('New Apartment')
        expect(page).to have_content 'New Apartment'
      end
      And "I can enter an apartment's information" do
        fill_in 'apartment[street_1]', with: '3064 Myrtle Ave'
        fill_in 'apartment[street_2]', with: ''
        fill_in 'apartment[city]', with: 'San Diego'
        fill_in 'apartment[state]', with: 'CA'
        fill_in 'apartment[country]', with: 'USA'
        fill_in 'apartment[zip]', with: '92104'
        fill_in 'apartment[name]', with: 'Peter Claasen'
        fill_in 'apartment[phone_number]', with: '888-888-8888'
        fill_in 'apartment[availability]', with: '3:00PM - 5:00PM, Wednesdays'
        click_button 'Create Apartment'
      end
      Then "I am taken to the successful creation page" do
        expect(page).to have_content 'Apartment was successfully created'
      end

    end
  end
end
