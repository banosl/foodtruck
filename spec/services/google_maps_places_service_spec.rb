require 'rails_helper'

RSpec.describe GoogleMapsPlacesService do
  # before :each do
  #   load_stubs
  # end
  describe "#find_place", :vcr do
    it "returns a places with its coordinates from a text query" do
      query = "Denver"
      response = GoogleMapsPlacesService.find_place(query)

      expect(response).to be_a(Hash)
      expect(response[:candidates]).to be_a(Array)
      expect(response[:status]).to eq("OK")

      response[:candidates].each do |result|
        expect(result).to have_key(:formatted_address)
        expect(result).to have_key(:geometry)
        expect(result).to have_key(:name)
        expect(result[:geometry]).to have_key(:location)
        expect(result[:geometry][:location]).to have_key(:lat)
        expect(result[:geometry][:location]).to have_key(:lng)
      end
    end
  end
end