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

  private

  def event_params
    params.permit(:event_date, :start_time, :end_time, :description, :city)
  end
end