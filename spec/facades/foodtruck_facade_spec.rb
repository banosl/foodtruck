require 'rails_helper'

RSpec.describe FoodtruckFacade do
  # before :each do
  #   load_stubs
  # end
  describe "self.get_place_search_details" do
    it "it returns a place with details of the search query", :vcr do
      query = "Denver"

      place = FoodtruckFacade.get_place_search_details(query)

      expect(place.name).to eq("Denver")
      expect(place.longitude).to eq(-104.990251)
      expect(place.latitude).to eq(39.7392358)
    end
  end

  describe "#self.foodtrucks_in_radius" do
    it "returns a list of food trucks from a user provided place", :vcr do 
      query = "Denver"

      place = FoodtruckFacade.get_place_search_details(query)
      foodtrucks = FoodtruckFacade.foodtrucks_in_radius(place)

      expect(foodtrucks[0].address).to eq("16TH St And California St, Denver, CO 80202")
      expect(foodtrucks[0].image_url).to eq("https://s3-media2.fl.yelpcdn.com/bphoto/9_RGrE1oyWgDWu7pofvtPg/o.jpg")
      expect(foodtrucks[0].latitude).to eq(39.74521)
      expect(foodtrucks[0].longitude).to eq(-104.9921817)
      expect(foodtrucks[0].name).to eq("Liang's Thai Food")
      expect(foodtrucks[0].phone).to eq("(720) 810-8693")
      expect(foodtrucks[0].url).to eq( "https://www.yelp.com/biz/liangs-thai-food-denver?adjust_creative=XaghGJ0FeP4n47CLhlhp1w&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=XaghGJ0FeP4n47CLhlhp1w")
    end
  end

end