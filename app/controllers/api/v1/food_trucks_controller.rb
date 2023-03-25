class Api::V1::FoodTrucksController < ApplicationController
  def index
    foodtrucks = FoodTruck.all
    render json: FoodTruckSerializer.new(foodtrucks)
  end

  def show
    truck = FoodTruck.find(params[:id])
    render json: FoodTruckSerializer.new(truck)
  end

end