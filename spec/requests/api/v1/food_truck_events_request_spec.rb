require 'rails_helper'

RSpec.describe 'endpoints for food truck event creation/updating' do
  before :all do
    @foodtruck = create(:food_truck)
  end

  it 'can create a new event for a foodtruck given appropriate data', vcr: { match_requests_on: [:method] } do
    event_params = {  event_date: "2023-03-31",
                      location: "6631 Beverly Blvd, Everett, WA 98203",
                      start_time: "2023-03-31 10:41:01 -0600",
                      end_time: "2023-03-31 12:41:01 -0600",
                      description: "We are going to be here selling food",
                      city: "Everett"
                    }

    post api_v1_food_truck_events_path(@foodtruck.id), params: event_params

    expect(response).to be_successful

    new_event = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(new_event).to have_key(:id)
    expect(new_event).to have_key(:attributes)
    expect(new_event[:attributes]).to be_a(Hash)
    expect(new_event[:attributes][:event_date]).to eq('2023-03-31')
    expect(new_event[:attributes][:latitude]).to eq(47.9368756)
    expect(new_event[:attributes][:longitude]).to eq(-122.2094365)
    expect(new_event[:attributes][:start_time]).to eq("2023-03-31 10:41:01 -0600")
    expect(new_event[:attributes][:end_time]).to eq("2023-03-31 12:41:01 -0600")
    expect(new_event[:attributes][:description]).to eq("We are going to be here selling food")
    expect(new_event[:attributes][:city]).to eq("Everett")
  end

  it 'can edit the information for an already created event', vcr: { match_requests_on: [:method] } do
    event = create(:event, food_truck_id: @foodtruck.id)
    expect(event.event_date).to_not eq((Date.today + 30.days).strftime('%Y-%m-%d'))
    expect(event.latitude).to_not eq(47.9368756)
    expect(event.longitude).to_not eq(-122.2094365)
    expect(event.start_time).to_not eq((Time.now + 400.hours).to_s)
    expect(event.end_time).to_not eq((Time.now + 402.hours).to_s)
    expect(event.description).to_not eq("We are going to be here selling food")
    expect(event.city).to_not eq("Everett")

    update_params = {  event_date: Date.today + 30.days,
                      location: "6631 Beverly Blvd, Everett, WA 98203",
                      start_time: "2023-04-20 02:42:11 -0700",
                      end_time: "2023-04-20 04:42:11 -0700",
                      description: "We are going to be here selling food",
                      city: "Everett"
                      }

    patch api_v1_food_truck_event_path(@foodtruck.id, event.id), params: update_params

    expect(response).to be_successful

    updated_event = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(updated_event[:attributes][:event_date]).to eq((Date.today + 30.days).strftime('%Y-%m-%d'))
    expect(updated_event[:attributes][:latitude]).to eq(47.9368756)
    expect(updated_event[:attributes][:longitude]).to eq(-122.2094365)
    expect(updated_event[:attributes][:start_time]).to eq(("2023-04-20 02:42:11 -0700"))
    expect(updated_event[:attributes][:end_time]).to eq(("2023-04-20 04:42:11 -0700"))
    expect(updated_event[:attributes][:description]).to eq("We are going to be here selling food")
    expect(updated_event[:attributes][:city]).to eq("Everett")

  end

  it 'can create an event with the location as just a street address', vcr: { match_requests_on: [:method] } do
    event_params = {  event_date: "2023-03-31",
                      location: "6631 Beverly Blvd",
                      start_time: "10:41:01",
                      end_time: "12:41:01",
                      description: "We are going to be here selling food",
                      city: "Everett"
                    }

    post api_v1_food_truck_events_path(@foodtruck.id), params: event_params

    expect(response).to be_successful

    new_event = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(new_event)
    expect(new_event[:attributes][:event_date]).to eq('2023-03-31')
    expect(new_event[:attributes][:latitude]).to eq(47.9368756)
    expect(new_event[:attributes][:longitude]).to eq(-122.2094365)
    expect(new_event[:attributes][:start_time]).to eq("10:41:01")
    expect(new_event[:attributes][:end_time]).to eq("12:41:01")
    expect(new_event[:attributes][:description]).to eq("We are going to be here selling food")
    expect(new_event[:attributes][:city]).to eq("Everett")
  end
end