require 'rails_helper'

RSpec.describe 'food truck API endpoints' do
  before(:all) do
    create_list(:food_truck, 5)
  end

  it 'can return all food_trucks in the database' do
    get 'api/v1/food_trucks'

    expect(response).to be_successful

    trucks = JSON.parse(response.body, symbolize_names: true)
    expect(trucks).to have_key(:data)
    expect(trucks[:data]).to be_an(Array)
    expect(trucks[:data].count).to eq(5)

    trucks[:data].each do |truck|
      expect(truck[:attributes]).to have_key(:name)
      expect(truck[:attributes]).to have_key(:cuisine_type)
      expect(truck[:attributes]).to have_key(:web_link)
      expect(truck[:attributes]).to have_key(:image_link)
    end
  end
end