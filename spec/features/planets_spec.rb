require 'rails_helper'

RSpec.describe 'planets features' do
  describe 'viewing the index' do
    it 'lists all planets' do
      u = User.create!(email: "anna@web.de", password: 'foobar')

      Planet.create!(user: u, title: Faker::Movies::StarWars.planet, host_name: Faker::TvShows::Stargate.character, price: "200")
      visit('/')
      click_link('Go Beyond')
      expect(page).to have_content('Galaxy Far, Far Away?')
    end
  end

  describe 'adding a new planet' do
    before do
      user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password") ## uncomment if not using FactoryBot
      login_as(user)
    end
  end
end

