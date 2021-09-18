require 'rails_helper'

RSpec.describe 'creating planet' do
  before do
    @anna = User.create(email: "anna@web.de", password: "123456")
    login_as(@anna)
    visit "/"

    click_link "Go Beyond"
    click_link "List your planet"

  end

  scenario "with valid inputs" do
    expect(current_path).to have_content('/planets/new')
    fill_in "Planet Name", with: "moon"
    fill_in "Host Name", with: "Sara"
    fill_in "Pricing $", with: "1000"
    fill_in "Description", with: "Let's fly to the moon"
    click_button "Publish"

    expect(current_path).to have_content('/planets')
    expect(page).to have_content("Planet has been created")
    planet = Planet.last
    expect(current_path).to eq(planet_path(planet))
    expect(planet.user_id).to eq(@anna.id)
  end

  scenario "with invalid inputs" do
    fill_in "Planet Name", with: ""
    fill_in "Host Name", with: ""
    fill_in "Pricing $", with: ""
    fill_in "Description", with: ""
    click_button "Publish"

    expect(page).to have_content("Planet has not been created")
  end
end