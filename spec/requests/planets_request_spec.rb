require 'rails_helper'

RSpec.describe 'planets requests' do
  let(:response_json) { JSON.parse(response.body) }
  describe 'GET /planets' do
    test_user = User.create(id: 1, email: "anna@planet.de", password: "foobar")

      Planet.create!(
        user: test_user,
        price: rand(100..500),
        name_of_space_station: Faker::TvShows::StarTrek.location,
        name_of_inhabitants: Faker::TvShows::StarTrek.specie,
        name_of_galaxy: Faker::Space.galaxy,
        title: 'Jedha',
        host_name: Faker::TvShows::Stargate.character,
        description: "Longing for a planet with exotic nature and stunning waterfalls? This is the right place for you if you want to get a break from your busy urban lifestyle. There are more trees than inhabitants. Here you are really connected to the nature as you'd live in treehouses and listen to the flow of water whereever you are. It just doesn't feel, like another planet, IT IS another planet."
      )
    it 'returns an array of planet titles' do
      
      get('/planets')
      
      expect(response_json['planets']).to include('Jedha')
    end

    it 'supports specifying planets for a specific title' do
      get('/planets', params: {title: 'Jedha'})
      expect(response_json['planets']).to include('Jedha')
    end
  end
end