class Api::V1::FoodTrucksController < ApplicationController
  def index
    foodtrucks = FoodTruck.all
    render json: FoodTruckSerializer.new(foodtrucks)
  end

end