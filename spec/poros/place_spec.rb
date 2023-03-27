require 'rails_helper'

RSpec.describe Place do
  it "place exists and has attributes" do
    data = {
      formatted_address: "Denver, CO, USA",
      geometry: {
          location: {
              lat: 39.7392358,
              lng: -104.990251
          },
          viewport: {
              northeast: {
                  lat: 39.91424689999999,
                  lng: -104.6002959
              },
              southwest: {
                  lat: 39.614431,
                  lng: -105.109927
              }
          }
      },
      name: "Denver"
    }

    place1 = Place.new(data)
    
    expect(place1.address).to eq("Denver, CO, USA")
    expect(place1.latitude).to eq(39.7392358)
    expect(place1.longitude).to eq(-104.990251)
    expect(place1.name).to eq("Denver")
  end
end