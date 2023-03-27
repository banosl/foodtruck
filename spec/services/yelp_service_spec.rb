require 'rails_helper'

RSpec.describe YelpService do
  before :each do
    load_stubs
  end
  describe '#get_food_trucks' do
    it 'returns a json of food trucks within a given radius from the supplied coordinates' do
      latitude = 39.7392358
      longitude = -104.990251

      response = YelpService.get_food_trucks(latitude, longitude)
      expect(response).to have_key(:businesses)
      expect(response[:businesses]).to be_a Array
      response[:businesses].each do |business|
        expect(business).to have_key(:id)
        expect(business[:id]).to be_a String
        expect(business).to have_key(:alias)
        expect(business[:alias]).to be_a String
        expect(business).to have_key(:name)
        expect(business[:name]).to be_a String
        expect(business).to have_key(:image_url)
        expect(business[:image_url]).to be_a String
        expect(business).to have_key(:url)
        expect(business[:url]).to be_a String
        expect(business).to have_key(:categories)
        expect(business[:categories]).to be_a Array
        expect(business).to have_key(:location)
        expect(business[:location]).to be_a Hash
        expect(business).to have_key(:phone)
        expect(business[:phone]).to be_a String
      end
    end
  end
end