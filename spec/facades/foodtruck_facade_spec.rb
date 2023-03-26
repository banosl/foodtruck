require 'rails_helper'

RSpec.describe FoodtruckFacade do
  describe "self.get_coordinates" do
    it "it returns the coordinates of a user provided place" do
      place = "Denver"

      result = FoodtruckFacade.get_coordinates(place)

      binding.pry
      # expect(coordinates).to eq
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