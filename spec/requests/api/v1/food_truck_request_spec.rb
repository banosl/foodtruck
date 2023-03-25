require 'rails_helper'

RSpec.describe 'food truck API endpoints' do
  before(:all) do
    Event.delete_all
    FoodTruck.delete_all
    create_list(:food_truck, 5)
    create_list(:event, 3, food_truck_id: FoodTruck.last.id)
  end

  it 'can return all food_trucks in the database' do
    get api_v1_food_trucks_path

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

  it 'can return a specific food_truck and all its associated events' do
    truck = FoodTruck.last
    get api_v1_food_truck_path(truck.id)

    expect(response).to be_successful

    truck_data = JSON.parse(response.body, symbolize_names: true)

    expect(truck_data).to have_key(:data)
    expect(truck_data[:data][:id]).to eq(truck.id.to_s)
    expect(truck_data[:data][:type]).to eq("food_truck")
    expect(truck_data[:data]).to have_key(:attributes)
    expect(truck_data[:data][:attributes][:name]).to eq(truck.name)
    expect(truck_data[:data][:attributes][:cuisine_type]).to eq(truck.cuisine_type)
    expect(truck_data[:data][:attributes][:web_link]).to eq(truck.web_link)
    expect(truck_data[:data][:attributes][:image_link]).to eq(truck.image_link)
    expect(truck_data[:data][:attributes]).to have_key(:events)
    expect(truck_data[:data][:attributes][:events]).to be_an(Array)
    expect(truck_data[:data][:attributes][:events].count).to eq(3)
    truck_data[:data][:attributes][:events].each do |event|
      expect(event).to have_key(:id)
      expect(event).to have_key(:food_truck_id)
      expect(event).to have_key(:event_date)
      expect(event).to have_key(:latitude)
      expect(event).to have_key(:longitude)
      expect(event).to have_key(:start_time)
      expect(event).to have_key(:end_time)
      expect(event).to have_key(:description)
      expect(event).to have_key(:created_at)
      expect(event).to have_key(:updated_at)
    end
  end
end