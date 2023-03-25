class Api::V1::FoodTrucksController < ApplicationController
  def index
    foodtrucks = FoodTruck.all
    render json: FoodTruckSerializer.new(foodtrucks)
  end

  def show
    truck = FoodTruck.find(params[:id])
    render json: FoodTruckSerializer.new(truck)
  end

  def create
    truck = FoodTruck.create(new_truck_params)
    render json: FoodTruckSerializer.new(truck)
  end

  private

  def new_truck_params
    params.permit(:name, :cuisine_type, :web_link, :image_link)
  end
end