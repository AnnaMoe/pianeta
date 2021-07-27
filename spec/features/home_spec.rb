require 'rails_helper'

RSpec.describe 'home features' do
  it 'displays the name of the app and links to the index-all planets page' do
    # tell capybara to visit that page:
    visit root_path
    # have this specific text in the html
    expect(page).to have_content('Space is full of surprises.')
    click_link('Go Beyond')
    expect(current_path).to eq('/planets')
    expect(page).to have_content('Galaxy Far, Far Away?')

  end
end