require 'rails_helper'

RSpec.describe GoogleMapsPlacesService do
  describe "#find_place" do
    it "returns a places with its coordinates from a text query" do
      query = "Denver"
      response = GoogleMapsPlacesService.find_place(query)

      expect(response).to be(successful)

      binding.pry
    end
  end
end