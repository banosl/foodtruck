class Api::V1::EventsController < ApplicationController
  def create
    new_event = Event.create_with_data(params[:food_truck_id], event_params, params[:location])
    render json: EventSerializer.new(new_event)
  end

  def update
    if Event.update_with_data(params[:id], event_params, params[:location] ||= nil)
      render json: EventSerializer.new(Event.find(params[:id]))
    else
      render json: { error: "Location Invalid" }, status: 422
    end
  end

  private

  def event_params
    params.permit(:event_date, :start_time, :end_time, :description, :city)
  end
end