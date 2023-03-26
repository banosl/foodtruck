require 'rails_helper'

RSpec.describe FoodtruckFacade do
  describe "self.get_place_search_details" do
    it "it returns a place with details of the search query" do
      query = "Denver"

      place = FoodtruckFacade.get_place_search_details(query)

      expect(place.name).to eq("Denver")
      expect(place.longitude).to eq(-104.990251)
      expect(place.latitude).to eq(39.7392358)
    end
  end

  describe "#self.foodtrucks_in_radius" do
    xit "returns a list of food trucks from a user provided place" do 
      place = "Denver"

      response = FoodtruckFacade.foodtrucks_in_radius(place)

      binding.pry
    end
  end

end