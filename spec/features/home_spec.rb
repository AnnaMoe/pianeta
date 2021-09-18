require 'rails_helper'

RSpec.describe 'home features' do
  it 'displays the name of the app and links to the index-all planets page' do
    # tell capybara to visit that page:
    visit root_path
    # have this specific text in the html
    expect(page).to have_content('Space is full of surprises.')
    click_link('Go Beyond')
    expect(page).to have_current_path('/planets')
    # page.within('h1.glow-header') do
    #   expect(page).to have_content('Galaxy Far, Far Away?')
    # end
    expect(page).to have_css('h1.glow-header', text: 'Galaxy Far, Far Away?')

  end
end