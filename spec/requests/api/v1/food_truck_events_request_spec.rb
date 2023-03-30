require 'rails_helper'

RSpec.describe 'endpoints for food truck event creation/updating' do
  before :all do
    @foodtruck = create(:food_truck)
  end

  it 'can create a new event for a foodtruck given appropriate data', vcr: { match_requests_on: [:method] } do
    event_params = {  event_date: Date.today,
                      location: "6631 Beverly Blvd, Everett, WA 98203",
                      start_time: Time.now,
                      end_time: Time.now + 2.hours,
                      description: "We are going to be here selling food",
                      city: "Everett"
                      }

    post api_v1_food_truck_events_path(@foodtruck.id), params: event_params

    expect(response).to be_successful

    new_event = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(new_event).to have_key(:id)
    expect(new_event).to have_key(:attributes)
    expect(new_event[:attributes]).to be_a(Hash)
    expect(new_event[:attributes][:event_date]).to eq(Date.today.strftime('%Y-%m-%d'))
    expect(new_event[:attributes][:latitude]).to eq(47.9368756)
    expect(new_event[:attributes][:longitude]).to eq(-122.2094365)
    expect(new_event[:attributes][:start_time]).to eq(Time.now.to_s)
    expect(new_event[:attributes][:end_time]).to eq((Time.now + 2.hours).to_s)
    expect(new_event[:attributes][:description]).to eq("We are going to be here selling food")
    expect(new_event[:attributes][:city]).to eq("Everett")
  end

  it 'can edit the information for an already created event' do
    event = create(:event, food_truck_id: @foodtruck.id)
    expect(event.event_date).to_not eq((Date.today + 30.days).strftime('%Y-%m-%d'))
    expect(event.latitude).to_not eq(47.9368756)
    expect(event.longitude).to_not eq(-122.2094365)
    expect(event.start_time).to_not eq((Time.now + 400.hours).to_s)
    expect(event.end_time).to_not eq((Time.now + 402.hours).to_s)
    expect(event.desciption).to_not eq("We are going to be here selling food")
    expect(event.city).to_not eq("Everett")

    update_params = {  event_date: Date.today + 30.days,
                      location: "6631 Beverly Blvd, Everett, WA 98203",
                      start_time: Time.now + 400.hours,
                      end_time: Time.now + 402.hours,
                      description: "We are going to be here selling food",
                      city: "Everett"
                      }

    patch api_v1_food_truck_event_path(@foodtruck.id, event.id) params: update_params

    expect(response).to be_successful

    updated_event = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(updated_event[:attributes][:event_date]).to eq(Date.today.strftime('%Y-%m-%d'))
    expect(updated_event[:attributes][:latitude]).to eq(47.9368756)
    expect(updated_event[:attributes][:longitude]).to eq(-122.2094365)
    expect(updated_event[:attributes][:start_time]).to eq(Time.now.to_s)
    expect(updated_event[:attributes][:end_time]).to eq((Time.now + 2.hours).to_s)
    expect(updated_event[:attributes][:description]).to eq("We are going to be here selling food")
    expect(updated_event[:attributes][:city]).to eq("Everett")

  end
end