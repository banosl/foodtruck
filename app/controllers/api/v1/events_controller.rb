class Api::V1::EventsController < ApplicationController
  def create
    truck = FoodTruck.find(params[:food_truck_id])
    place = FoodtruckFacade.get_place_search_details(params[:location])
    new_event = truck.events.new(event_params)
    new_event.latitude = place.latitude
    new_event.longitude = place.longitude
    new_event.save
    render json: EventSerializer.new(new_event)
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    if params[:location]
      place = FoodtruckFacade.get_place_search_details(params[:location])
      event.update(latitude: place.latitude)
      event.update(longitude: place.longitude)
    end
    render json: EventSerializer.new(event)
  end

  private

  def event_params
    params.permit(:event_date, :start_time, :end_time, :description, :city)
  end
end