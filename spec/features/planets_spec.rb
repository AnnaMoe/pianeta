require 'rails_helper'

RSpec.describe 'planets features' do
  describe 'viewing the index' do
    it 'lists all planets' do
      u = User.create!(email: "anna@planet.de", password: 'foobar')
      Planet.create!(user: u, title: Faker::Movies::StarWars.planet, host_name: Faker::TvShows::Stargate.character)
      visit('/')
      click_link('Go Beyond')
      expect(page).to have_content('Galaxy Far, Far Away?')
    end
  end
end