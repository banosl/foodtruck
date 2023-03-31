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
      expect(truck[:attributes][:name]).to be_a String
      expect(truck[:attributes]).to have_key(:cuisine_type)
      expect(truck[:attributes][:cuisine_type]).to be_a String
      expect(truck[:attributes]).to have_key(:web_link)
      expect(truck[:attributes][:web_link]).to be_a String
      expect(truck[:attributes]).to have_key(:image_link)
      expect(truck[:attributes][:image_link]).to be_a String
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
      expect(event[:id]).to be_a Integer
      expect(event).to have_key(:food_truck_id)
      expect(event[:food_truck_id]).to be_a Integer
      expect(event).to have_key(:event_date)
      expect(event[:event_date]).to be_a String
      expect(event).to have_key(:latitude)
      expect(event[:latitude]).to be_a Float
      expect(event).to have_key(:longitude)
      expect(event[:longitude]).to be_a Float
      expect(event).to have_key(:start_time)
      expect(event[:start_time]).to be_a String
      expect(event).to have_key(:end_time)
      expect(event[:end_time]).to be_a String
      expect(event).to have_key(:description)
      expect(event[:description]).to be_a String
      expect(event).to have_key(:created_at)
      expect(event).to have_key(:updated_at)
    end
  end

  it 'can create a new food truck' do
    truck_params = {  name: "This is my new food truck",
                      cuisine_type: "Delicious food!",
                      web_link: "www.yumyumtruck.com",
                      image_link: "www.yumyumtruck.com/cool_photo.jpg"}

    post api_v1_food_trucks_path, params: truck_params

    expect(response).to be_successful

    new_truck = FoodTruck.last

    expect(new_truck.name).to eq("This is my new food truck")
    expect(new_truck.cuisine_type).to eq("Delicious food!")
    expect(new_truck.web_link).to eq("www.yumyumtruck.com")
    expect(new_truck.image_link).to eq("www.yumyumtruck.com/cool_photo.jpg")
  end

  it 'can update a trucks attributes via a patch request' do
    old_truck = FoodTruck.last
    updated_info = {  name: "I like this truck a lot",
                      cuisine_type: "our food is better than yours",
                      web_link: "www.yumyumtruck.com",
                      image_link: "www.yumyumtruck.com/cool_photo.jpg"}

    patch api_v1_food_truck_path(old_truck.id), params: updated_info

    expect(response).to be_successful

    updated_truck = FoodTruck.find(old_truck.id)
    expect(updated_truck.name).to eq("I like this truck a lot")
    expect(updated_truck.name).to_not eq(old_truck.name)
    expect(updated_truck.cuisine_type).to eq("our food is better than yours")
    expect(updated_truck.cuisine_type).to_not eq(old_truck.cuisine_type)
    expect(updated_truck.web_link).to eq("www.yumyumtruck.com")
    expect(updated_truck.web_link).to_not eq(old_truck.web_link)
    expect(updated_truck.image_link).to eq("www.yumyumtruck.com/cool_photo.jpg")
    expect(updated_truck.image_link).to_not eq(old_truck.image_link)
  end

  it 'can return only food trucks belonging to a city defined in a query param' do
    @truck1 = create(:food_truck)
    create(:event, city: "Seattle", food_truck_id: @truck1.id)
    @truck2 = create(:food_truck)
    create(:event, city: "Seattle", food_truck_id: @truck2.id)

    get api_v1_food_trucks_path, params: { city: "Seattle" }

    expect(response).to be_successful

    seattle_trucks = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(seattle_trucks.count).to eq(2)



  end
end