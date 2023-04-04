class FoodtruckFacade
  def self.get_place_search_details(query)
    results = GoogleMapsPlacesService.find_place(query)
    unless results[:candidates] == []
      Place.new(results[:candidates].first)
    else
      "No Results Found"
    end
  end

  def self.foodtrucks_in_radius(place)
    results = YelpService.get_food_trucks(place.latitude, place.longitude)
    results[:businesses].map do |truck_data|
      Foodtruck.new(truck_data)
    end
  end
end