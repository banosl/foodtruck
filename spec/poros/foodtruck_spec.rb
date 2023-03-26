require 'rails_helper'

RSpec.describe Foodtruck do
  it 'foodtruck exists and has attributes' do
    data = {
      "id": "gN8o-SG2PgCQGYrOCkkqng",
      "alias": "liangs-thai-food-denver",
      "name": "Liang's Thai Food",
      "image_url": "https://s3-media2.fl.yelpcdn.com/bphoto/9_RGrE1oyWgDWu7pofvtPg/o.jpg",
      "is_closed": false,
      "url": "https://www.yelp.com/biz/liangs-thai-food-denver?adjust_creative=OwvDgRtTs1k3C1_VUOGMbA&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=OwvDgRtTs1k3C1_VUOGMbA",
      "review_count": 420,
      "categories": [
          {
              "alias": "thai",
              "title": "Thai"
          },
          {
              "alias": "foodtrucks",
              "title": "Food Trucks"
          }
      ],
      "rating": 4.5,
      "coordinates": {
          "latitude": 39.74521,
          "longitude": -104.9921817
      },
      "transactions": [
          "delivery"
      ],
      "price": "$",
      "location": {
          "address1": "16TH St And California St",
          "address2": "",
          "address3": "",
          "city": "Denver",
          "zip_code": "80202",
          "country": "US",
          "state": "CO",
          "display_address": [
              "16TH St And California St",
              "Denver, CO 80202"
          ]
      },
      "phone": "+17208108693",
      "display_phone": "(720) 810-8693",
      "distance": 684.5032800923377
    }

    foodtruck = Foodtruck.new(data)

    expect(foodtruck).to be_instance_of(Foodtruck)
    expect(foodtruck.name).to eq("Liang's Thai Food")
    expect(foodtruck.image_url).to eq("https://s3-media2.fl.yelpcdn.com/bphoto/9_RGrE1oyWgDWu7pofvtPg/o.jpg")
    expect(foodtruck.url).to eq("https://www.yelp.com/biz/liangs-thai-food-denver?adjust_creative=OwvDgRtTs1k3C1_VUOGMbA&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=OwvDgRtTs1k3C1_VUOGMbA")
    expect(foodtruck.latitude).to eq(39.74521)
    expect(foodtruck.longitude).to eq(-104.9921817)
    expect(foodtruck.address).to eq("16TH St And California St, Denver, CO 80202")
    expect(foodtruck.phone).to eq("(720) 810-8693")
  end
end