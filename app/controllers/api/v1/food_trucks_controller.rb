class Api::V1::FoodTrucksController < ApplicationController
  def index
    if params[:city]
      render json: FoodTruckSerializer.new(FoodTruck.joins(:events).where(events: { city: params[:city] } ))
    else 
      foodtrucks = FoodTruck.all
      render json: FoodTruckSerializer.new(foodtrucks)
    end
  end

  def show
    truck = FoodTruck.find(params[:id])
    render json: FoodTruckSerializer.new(truck)
  end

  def create
    truck = FoodTruck.create(truck_params)
    render json: FoodTruckSerializer.new(truck)
  end

  def update
    truck = FoodTruck.find(params[:id])
    truck.update(truck_params)
    render json: FoodTruckSerializer.new(truck)
  end

  private

  def truck_params
    params.permit(:name, :cuisine_type, :web_link, :image_link)
  end
end
