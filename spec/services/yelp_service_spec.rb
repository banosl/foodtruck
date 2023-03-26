require 'rails_helper'

RSpec.describe YelpService do
  describe '#get_food_trucks' do
    it 'returns a json of food trucks within a given radius from the supplied coordinates' do
      latitude = 39.7392358
      longitude = -104.990251

      response = YelpService.get_food_trucks(latitude, longitude)
      
      expect(response).to have_key(:businesses)

      response[:businesses].each do |business|
        expect(business).to have_key(:id)
        expect(business).to have_key(:alias)
        expect(business).to have_key(:name)
        expect(business).to have_key(:image_url)
        expect(business).to have_key(:url)
        expect(business).to have_key(:categories)
        expect(business).to have_key(:location)
        expect(business).to have_key(:phone)
      end
    end
  end
end